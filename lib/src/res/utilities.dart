import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:general_utilities/src/res/dimens.dart';

class Utilities {
  Utilities._();

  static Future<void> showSnackBar(BuildContext context, String msg,
      {Duration duration = const Duration(seconds: 2)}) {
    _hideSnackBar(duration, context);

    return showModalBottomSheet<void>(
        context: context,
        builder: (context) {
          return Container(
            padding: const EdgeInsets.all(Dimens.dimenNormal),
            height: Dimens.snackBarSize,
            child: Text(
              msg,
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.start,
            ),
          );
        });
  }

  static void _hideSnackBar(Duration duration, BuildContext context) {
    Future.delayed(duration, () => Navigator.pop(context));
  }
}
