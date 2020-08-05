import 'package:flutter/material.dart';
import 'package:general_utilities/src/res/dimens.dart';

/// Create a [GridView] easily and cut boilerplate code
/// just pass the [children] list and custom your gridview values.
class GridViewWidget extends StatelessWidget {
  const GridViewWidget(
      {Key key,
      @required this.children,
      this.mobileCount = 2,
      this.tabletCount = 4,
      this.aspectRatio = 3.0 / 4.0})
      : super(key: key);

  final int mobileCount;
  final int tabletCount;
  final double aspectRatio;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final bool isTablet = MediaQuery.of(context).size.width >= 600;

    return GridView(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: isTablet ? tabletCount : mobileCount,
          childAspectRatio: aspectRatio),
      padding: const EdgeInsets.all(kDimenNormal),
      children: children,
    );
  }
}
