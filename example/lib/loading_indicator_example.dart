import 'package:flutter/material.dart';
import 'package:general_utilities/general_utilities.dart';

class LoadingIndicatorExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: LoadingIndicator(),
      ),
    );
  }
}
