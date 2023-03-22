import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

import '../enum/animate_direction.dart';

class SlideInAnimation extends StatelessWidget {
  const SlideInAnimation({
    super.key,
    required this.child,
    this.animateDirection = AnimateDirection.left,
    this.durationMilliseconds = 1200,
    this.moveAmount = 100,
    this.developerMode = false,
  });

  final Widget child;

  /// [slideInAxis] is the axis of the slide in animation.
  final AnimateDirection animateDirection;

  /// [durationMilliseconds] is the duration of the animation in milliseconds.
  final double durationMilliseconds;

  /// [moveAmount] is the amount of pixels the widget.
  final double moveAmount;

  final bool developerMode;

  calcMovement(double value) {
    switch (animateDirection) {
      case AnimateDirection.top:
        return Offset(0, value);
      case AnimateDirection.right:
        return Offset(-value, 0);
      case AnimateDirection.bottom:
        return Offset(0, -value);
      case AnimateDirection.left:
        return Offset(value, 0);
      case AnimateDirection.none:
        throw Exception(
            'AnimateDirection.none is not supported in SlideInAnimation.');
    }
  }

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(
        'move',
        Tween<double>(begin: -moveAmount, end: 0),
        duration: Duration(milliseconds: durationMilliseconds.toInt()),
        curve: Curves.easeInOutCirc,
      );

    return PlayAnimationBuilder(
        tween: tween,
        duration: tween.duration,
        developerMode: developerMode,
        builder: ((context, value, child) {
          return Transform.translate(
            offset: calcMovement(value.get('move')),
            child: child,
          );
        }),
        child: child);
  }
}
