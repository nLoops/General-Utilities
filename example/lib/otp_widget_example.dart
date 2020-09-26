import 'package:flutter/material.dart';
import 'package:general_utilities/general_utilities.dart';

class OtpWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          FlutterLogo(
            size: 150.0,
          ),
          SpaceWidget(),
          OtpWidget(
            count: 6,
            border: OtpBorder.RECT,
            screenWidth: MediaQuery.of(context).size.width,
            onComplete: (otp) => print(otp),
          )
        ],
      ),
    );
  }
}
