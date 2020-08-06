import 'package:flutter/material.dart';
import 'package:general_utilities/general_utilities.dart';
import 'package:general_utilities/src/res/dimens.dart';

/// Empty state widget useful in reduce boilerplate code
/// just pass [image] and optional [title] to display an empty state
/// to your user.
class EmptyStateWidget extends StatelessWidget {
  final String title;
  final ImageProvider image;

  const EmptyStateWidget({Key key, @required this.title, @required this.image})
      : assert(image != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: kDefaultEmptyStateSize,
            height: kDefaultEmptyStateSize,
            child: Image(image: image),
          ),
          SpaceWidget(),
          Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          )
        ],
      ),
    );
  }
}
