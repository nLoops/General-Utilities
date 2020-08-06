import 'package:flutter/material.dart';
import 'package:general_utilities/general_utilities.dart';

class EmptyStateExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Empty state example'),
      ),
      body: const EmptyStateWidget(
          title: 'No data found to display',
          image: AssetImage('assets/images/Icon-512.png')),
    );
  }
}
