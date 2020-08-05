import 'package:flutter/material.dart';
import 'package:general_utilities/general_utilities.dart';

final List<String> _data = List.generate(100, (index) => 'Item $index');

class FooterWidgetExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Footer layout example'),),
      body: FooterLayout(
          body: ListView(
            padding: const EdgeInsets.all(kDimenNormal),
            children: [
              for (var item in _data)
                WidgetAnimator(ListTile(
                  title: Text(item),
                ))
            ],
          ),
          footer: Container(
            height: kToolbarHeight,
            color: Colors.grey.shade200,
            child: Center(
              child: Text(
                'ADD TO CART',
                style:
                Theme.of(context).textTheme.button.apply(color: Colors.black),
              ),
            ),
          )),
    );
  }
}
