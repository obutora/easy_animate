import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

import '../enum/animate_direction.dart';

class FadeOutAnimation extends StatelessWidget {
  const FadeOutAnimation({
    super.key,
    required this.child,
    this.animateDirection = AnimateDirection.none,
    this.durationMilliseconds = 1200,
    this.moveAmount = 100,
    this.developerMode = false,
  });

  final Widget child;

  /// [fadeInAxis] is the axis of the fade out animation.
  final AnimateDirection animateDirection;

  /// [durationMilliseconds] is the duration of the animation in milliseconds.
  final double durationMilliseconds;

  /// [moveAmount] is the amount of pixels the widget.
  final double moveAmount;

  final bool developerMode;

  calcMovement(double value) {
    switch (animateDirection) {
      case AnimateDirection.none:
        return const Offset(0, 0);
      case AnimateDirection.top:
        return Offset(0, -value);
      case AnimateDirection.right:
        return Offset(value, 0);
      case AnimateDirection.bottom:
        return Offset(0, value);
      case AnimateDirection.left:
        return Offset(-value, 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(
        'opacity',
        Tween<double>(begin: 1, end: 0),
        duration: Duration(milliseconds: durationMilliseconds.toInt()),
        curve: Curves.ease,
      )
      ..tween(
        'move',
        Tween<double>(begin: 0, end: moveAmount),
        duration: Duration(milliseconds: durationMilliseconds.toInt()),
        curve: Curves.easeOutCirc,
      );

    return PlayAnimationBuilder(
        tween: tween,
        duration: tween.duration,
        developerMode: developerMode,
        builder: ((context, value, child) {
          return Transform.translate(
              offset: calcMovement(value.get('move')),
              child: Opacity(opacity: value.get('opacity'), child: child));
        }),
        child: child);
  }
}
