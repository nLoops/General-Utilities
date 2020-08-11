import 'package:flutter/material.dart';
import 'package:general_utilities/src/res/dimens.dart';

/// An [Overlay] helper widget to display snackbar without [Scaffold]
/// [show] displaying snackbar with custom values and action callback
/// [hide] make snackbar not visible after passed duration
class SnackBarWidget extends StatelessWidget {
  const SnackBarWidget(
      {Key key,
      this.msg,
      this.action,
      this.actionTitle,
      this.backgroundColor = Colors.black87,
      this.msgStyle =
          const TextStyle(fontSize: kDimenNormal, color: Colors.white)})
      : super(key: key);

  final String msg;
  final VoidCallback action;
  final String actionTitle;
  final Color backgroundColor;
  final TextStyle msgStyle;
  static OverlayEntry currentLoader;

  static void show(BuildContext context, String msg,
      {VoidCallback action,
      String actionTitle,
      Color backgroundColor = Colors.black87,
      TextStyle msgStyle =
          const TextStyle(fontSize: kDimenNormal, color: Colors.white),
      Duration duration = const Duration(seconds: 2)}) {
    currentLoader = OverlayEntry(builder: (_) {
      return _SnackBarBody(
        msg: msg,
        action: action,
        actionTitle: actionTitle,
        backgroundColor: backgroundColor,
        msgStyle: msgStyle,
      );
    });

    Overlay.of(context)?.insert(currentLoader);

    Future.delayed(duration, () => hide());
  }

  static void hide() {
    if (currentLoader == null) return;
    currentLoader?.remove();
  }

  @override
  Widget build(BuildContext context) {
    return _SnackBarBody(
      msg: msg,
      actionTitle: actionTitle,
      action: action,
      backgroundColor: backgroundColor,
      msgStyle: msgStyle,
    );
  }
}

class _SnackBarBody extends StatelessWidget {
  const _SnackBarBody(
      {Key key,
      @required this.msg,
      this.action,
      this.actionTitle,
      this.msgStyle,
      this.backgroundColor})
      : assert(msg != null),
        super(key: key);

  final String msg;
  final VoidCallback action;
  final String actionTitle;
  final Color backgroundColor;
  final TextStyle msgStyle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 100, end: 0),
        duration: Duration(milliseconds: 250),
        builder: (_, value, child) {
          return Transform.translate(
            offset: Offset(0, value),
            child: child,
          );
        },
        child: buildBody(context),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Container(
        margin: const EdgeInsets.all(kDimenMedium),
        padding: const EdgeInsets.all(kDimenMedium),
        height: kSnackBarSize,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(kDimenMedium),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text(
                msg,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: msgStyle,
              ),
            ),
            SizedBox(
              width: kDimenMedium,
            ),
            Visibility(
              visible: action != null,
              child: FlatButton(
                  onPressed: action,
                  child: Text(
                    actionTitle ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .button
                        .apply(color: Theme.of(context).accentColor),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
