import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:general_utilities/src/res/dimens.dart';

class NoDataWidget extends StatelessWidget {
  final String title;
  final String asset;
  final bool isSvg;

  const NoDataWidget({Key key, @required this.title, @required this.asset,
  this.isSvg = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: Dimens.emptyStateSize,
            height: Dimens.emptyStateSize,
            child: isSvg ? SvgPicture.asset(asset) : Image.asset(asset),
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
