import 'package:flutter/material.dart';
import 'package:general_utilities/general_utilities.dart';

/// A space widget to add spacing between widgets in [Row] or [Column]
/// if [isVertical] is true it will be a vertical spacing fit to [Column]
/// else if [isVertical] is false it will be a horizontal spacing fit to [Row]
/// for performance you can call const constructor.
class SpaceWidget extends StatelessWidget {
  final double space;
  final bool isVertical;

  const SpaceWidget(
      {Key key, this.space = kDimenNormal, this.isVertical = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isVertical ? 0 : space,
      height: isVertical ? space : 0,
    );
  }
}
