import 'package:flutter/material.dart';

/// A [MaterialPageRoute] widget with ready made animations
/// just pass [AnimationDirection] with [builder] method and
/// it will handle the rest.
enum AnimationDirection {
  from_right_to_left,
  from_left_to_right,
  from_bottom_to_top,
  from_top_to_bottom,
  fade
}

class WidgetRouteAnimation extends MaterialPageRoute {
  AnimationDirection animationDirection;
  Cubic curves;

  WidgetRouteAnimation(
      {@required WidgetBuilder builder,
      RouteSettings settings,
      AnimationDirection animationDirection =
          AnimationDirection.from_left_to_right,
      Cubic curves = Curves.easeInOut,
      bool maintainState = true,
      bool fullscreenDialog = false})
      : animationDirection = animationDirection,
        curves = curves,
        super(
            builder: builder,
            settings: settings,
            maintainState: maintainState,
            fullscreenDialog: fullscreenDialog);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    Animation customAnimation;

    if (animationDirection == AnimationDirection.from_left_to_right) {
      customAnimation = Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
          .animate(CurvedAnimation(parent: animation, curve: curves));
      return SlideTransition(
        position: customAnimation,
        child: child,
      );
    } else if (animationDirection == AnimationDirection.from_right_to_left) {
      customAnimation = Tween(begin: Offset(-1.0, 0.0), end: Offset(0.0, 0.0))
          .animate(CurvedAnimation(parent: animation, curve: curves));
      return SlideTransition(
        position: customAnimation,
        child: child,
      );
    } else if (animationDirection == AnimationDirection.from_bottom_to_top) {
      customAnimation = Tween(begin: Offset(0.0, 1.0), end: Offset(0.0, 0.0))
          .animate(CurvedAnimation(parent: animation, curve: curves));
      return SlideTransition(
        position: customAnimation,
        child: child,
      );
    } else if (animationDirection == AnimationDirection.from_top_to_bottom) {
      customAnimation = Tween(begin: Offset(0.0, -1.0), end: Offset(0.0, 0.0))
          .animate(CurvedAnimation(parent: animation, curve: curves));
      return SlideTransition(
        position: customAnimation,
        child: child,
      );
    } else if (animationDirection == AnimationDirection.fade) {
      customAnimation = Tween(begin: 0.0, end: 1.0)
          .animate(CurvedAnimation(parent: animation, curve: curves));
      return FadeTransition(
        opacity: customAnimation,
        child: child,
      );
    } else {
      throw new Exception("Animation direction is invalid or null");
    }
  }
}
