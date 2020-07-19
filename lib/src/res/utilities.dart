import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_utilities/src/res/dimens.dart';

class Utilities {
  Utilities._();

  /// Default snackbar requires a Scaffold which will be not available
  /// all times for example if you're using BLoC Listener and want to show
  /// a snackbar on Event, this work around will help you achieve this goal.
  static Future<void> showSnackBar(BuildContext context, String msg,
      {Duration duration = const Duration(seconds: 2), Color backgroundColor,
      TextStyle msgStyle}) {
    _hideSnackBar(duration, context);

    return showModalBottomSheet<void>(
        context: context,
        isDismissible: false,
        enableDrag: false,
        builder: (context) {
          return Container(
            color: backgroundColor == null
            ? Colors.white
            : backgroundColor,
            padding: const EdgeInsets.all(Dimens.dimenNormal),
            height: Dimens.snackBarSize,
            child: Text(
              msg,
              style: msgStyle == null
              ? Theme.of(context).textTheme.bodyText1.apply(color: Colors.black)
              : msgStyle,
              textAlign: TextAlign.start,
            ),
          );
        });
  }

  static void _hideSnackBar(Duration duration, BuildContext context) {
    Future.delayed(duration, () => Navigator.pop(context));
  }
}
