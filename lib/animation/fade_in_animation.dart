import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../enum/animate_direction.dart';
import '../enum/animate_type.dart';

class FadeInAnimation extends StatelessWidget {
  const FadeInAnimation({
    super.key,
    required this.child,
    this.animateType = AnimateType.once,
    this.animateDirection = AnimateDirection.none,
    this.durationMilliseconds = 1200,
    this.moveAmount = 100,
    this.developerMode = false,
  });

  final Widget child;

  /// [animateType] is the type of animation to be played.
  ///
  /// [animateType.once] plays the animation once.
  /// [animateType.mirror] plays the animation once and then plays it in reverse.
  /// [animateType.loop] plays the animation in a loop.
  final AnimateType animateType;

  /// [fadeInAxis] is the axis of the fade in animation.
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
        return Offset(0, value);
      case AnimateDirection.right:
        return Offset(-value, 0);
      case AnimateDirection.bottom:
        return Offset(0, -value);
      case AnimateDirection.left:
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

    return CustomAnimationBuilder(
        control: animateType.getController,
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
