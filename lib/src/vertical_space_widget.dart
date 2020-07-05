import 'package:flutter/material.dart';
import 'package:general_utilities/src/res/dimens.dart';

class VerticalSpaceWidget extends StatelessWidget {
  final double height;

  const VerticalSpaceWidget({Key key, this.height = Dimens.dimenNormal})
  :super(key:key);


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}
