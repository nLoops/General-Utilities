import 'package:flutter/material.dart';
import 'package:general_utilities/src/res/dimens.dart';

/// A Spacing Widget it can be used to add space between
/// widgets vertically.
/// Default value is the normal guideline spacing 16.0
class VerticalSpaceWidget extends StatelessWidget {
  final double height;

  const VerticalSpaceWidget({Key key, this.height = Dimens.dimenNormal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
