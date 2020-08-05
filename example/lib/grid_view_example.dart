import 'package:flutter/material.dart';
import 'package:general_utilities/general_utilities.dart';

final List<String> _data = List.generate(50, (index) => 'Number $index');

class GridViewExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: GridViewWidget(children: [
        for (var item in _data)
          Card(
            child: Center(
              child: Text(item),
            ),
          )
      ]),
    );
  }
}
