import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:general_utilities/src/res/dimens.dart';

class NoDataWidget extends StatelessWidget {
  final String title;
  final String asset;
  final bool isSVG;

  const NoDataWidget(
      {Key key, @required this.title, @required this.asset, this.isSVG = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: Dimens.emptyStateSize,
              height: Dimens.emptyStateSize,
              child: isSVG ? SvgPicture.asset(asset) : Image.asset(asset),
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
      ),
    );
  }
}
