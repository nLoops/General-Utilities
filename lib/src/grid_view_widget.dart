import 'package:flutter/material.dart';
import 'package:general_utilities/src/res/dimens.dart';

/// This widget helps to save time of repeatedly build GridView
/// just pass the List<Widget> you need to display and adjust
/// aspect ratio, also the count of displaying items in case of
/// responsive design support.
class GridViewWidget extends StatelessWidget {
  const GridViewWidget({Key key, @required this.children,
    this.mobileCount = 2, this.tabletCount = 4, this.aspectRatio = 3.0/4.0}) : super(key: key);

  final int mobileCount;
  final int tabletCount;
  final double aspectRatio;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.width >= 600;

    return GridView(
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: isTablet
          ? tabletCount : mobileCount,
          childAspectRatio: aspectRatio),
      padding: const EdgeInsets.all(Dimens.dimenNormal),
      children: children,
    );
  }
}