import 'package:flutter/material.dart';
import 'package:simple_animations/animation_builder/play_animation_builder.dart';
import 'package:simple_animations/movie_tween/movie_tween.dart';

class FadeOutAnimation extends StatelessWidget {
  const FadeOutAnimation({
    super.key,
    required this.child,
    this.fadeInAxis = FadeInAxis.none,
    this.durationMilliseconds = 1200,
    this.moveAmount = 100,
    this.developerMode = false,
  });

  final Widget child;

  /// [fadeInAxis] is the axis of the fade in animation.
  final FadeInAxis fadeInAxis;

  /// [durationMilliseconds] is the duration of the animation in milliseconds.
  final double durationMilliseconds;

  /// [moveAmount] is the amount of pixels the widget.
  final double moveAmount;

  final bool developerMode;

  calcMovement(double value) {
    switch (fadeInAxis) {
      case FadeInAxis.none:
        return const Offset(0, 0);
      case FadeInAxis.top:
        return Offset(0, value);
      case FadeInAxis.right:
        return Offset(-value, 0);
      case FadeInAxis.bottom:
        return Offset(0, -value);
      case FadeInAxis.left:
        return Offset(value, 0);
    }
  }

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(
        'opacity',
        Tween<double>(begin: 0, end: 1),
        duration: Duration(milliseconds: durationMilliseconds.toInt()),
        curve: Curves.ease,
      )
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
              child: Opacity(opacity: value.get('opacity'), child: child));
        }),
        child: child);
  }
}

enum FadeInAxis {
  none,
  top,
  right,
  bottom,
  left,
}
