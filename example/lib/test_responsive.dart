import 'package:flutter/material.dart';
import 'package:general_utilities/general_utilities.dart';

class TestResponsive extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ResponsiveLayoutWidget(mobile: _mobile(), tablet: _tablet()),
    );
  }

  Widget _mobile(){
    return Column(
      children: [
        NoDataWidget(title: 'No Data', asset: 'assets/images/Icon-512.png'),
        VerticalSpaceWidget(),
        Text('Thi is Mobile Version')
      ],
    );
  }

  Widget _tablet(){
    return Row(
      children: [
        NoDataWidget(title: 'No Data', asset: 'assets/images/Icon-512.png'),
        HorizontalSpaceWidget(),
        Text('Thi is Tablet Version')
      ],
    );
  }

}
