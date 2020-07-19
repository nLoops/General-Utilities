import 'package:flutter/material.dart';
import 'package:general_utilities/src/res/dimens.dart';

/// A Spacing Widget it can be used to add space between
/// widgets horizontally.
/// Default value is the normal guideline spacing 16.0
class HorizontalSpaceWidget extends StatelessWidget {
  final double width;

  const HorizontalSpaceWidget({Key key, this.width = Dimens.dimenNormal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width,);
  }
}
