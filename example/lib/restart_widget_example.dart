import 'package:flutter/material.dart';
import 'package:general_utilities/general_utilities.dart';

class RestartWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restart Widget example'),
      ),
      body: Container(
        child: Center(
          child: RaisedButton(
            onPressed: () => RestartWidget.restartApp(context),
            child: Text('RESTART APP'),
          ),
        ),
      ),
    );
  }
}
