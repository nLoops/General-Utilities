import 'package:flutter/material.dart';
import 'package:general_utilities/src/res/dimens.dart';

class DataLoadingWidget extends StatelessWidget {
  final String title;

  const DataLoadingWidget({Key key,@required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.secondary),
            ),
            SizedBox(
              height: Dimens.dimenNormal,
            ),
            Text(
              title,
              style: Theme.of(context).textTheme.bodyText1,
            )
          ],
        ),
      ),
    );
  }
}
