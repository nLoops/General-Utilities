import 'package:flutter/material.dart';

/// Responsive Widget you can pass two versions of widgets
/// one for Mobile and the other for Tablet and this widget will
/// handle that
class ResponsiveLayoutWidget extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;

  const ResponsiveLayoutWidget(
      {Key key, @required this.mobile, @required this.tablet})
      : assert(mobile != null),
        assert(tablet != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isTablet = MediaQuery.of(context).size.width >= 600;
    return isTablet ? tablet : mobile;
  }
}
