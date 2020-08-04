import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// An [Overlay] widget with two static functions
/// [show] to make loading indicator visible
/// [hide] to make loading indicator not visible
/// [_ProgressIndicator] could be replaced by any custom indicator widget
/// if current platform is Android => return [CircularProgressIndicator]
/// if current platform is IOS => return [CupertinoActivityIndicator]
/// for example you can pass one of https://pub.dev/packages/flutter_spinkit
class LoadingIndicator extends StatelessWidget {
  LoadingIndicator(
      {Key key,
      this.width = 250.0,
      this.height = 250.0,
      this.color = Colors.white70,
      Widget child})
      : child = child ?? Platform.isAndroid
            ? CircularProgressIndicator()
            : CupertinoActivityIndicator();

  final double width;
  final double height;
  final Color color;
  final Widget child;
  static OverlayEntry currentLoader;

  // static method to be called from outside widget.
  static void show(BuildContext context,
      {double width, double height, Color color, Widget child}) {
    if (child == null) {
      child = Platform.isAndroid
          ? CircularProgressIndicator()
          : CupertinoActivityIndicator();
    }

    currentLoader = OverlayEntry(builder: (ctx) {
      return Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            color: Theme.of(context).backgroundColor.withOpacity(.8),
            child: Center(
              child: SizedBox(
                height: height,
                width: width,
                child: child,
              ),
            ),
          )
        ],
      );
    });

    Overlay.of(context)?.insert(currentLoader);
  }

  // Static void to hide loading widget
  static void hide() {
    if (currentLoader == null) return;
    currentLoader?.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height,
        width: width,
        child: _ProgressIndicator(
          child: child,
        ),
      ),
    );
  }
}

class _ProgressIndicator extends StatelessWidget {
  final Widget child;

  const _ProgressIndicator({Key key, @required this.child})
      : assert(child != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
