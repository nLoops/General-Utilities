import 'package:flutter/material.dart';
import 'package:general_utilities/src/res/dimens.dart';

class HorizontalSpaceWidget extends StatelessWidget {
  final double width;

  const HorizontalSpaceWidget({Key key, this.width = Dimens.dimenNormal})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(width: width,);
  }
}
