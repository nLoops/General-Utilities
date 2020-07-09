import 'package:flutter/material.dart';
import 'package:general_utilities/src/res/dimens.dart';

class NoDataWidget extends StatelessWidget {
  final String title;
  final String asset;

  const NoDataWidget({Key key, @required this.title, @required this.asset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: Dimens.emptyStateSize,
            height: Dimens.emptyStateSize,
            child: Image.asset(asset),
          ),
          SizedBox(
            height: Dimens.dimenMedium,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }
}
