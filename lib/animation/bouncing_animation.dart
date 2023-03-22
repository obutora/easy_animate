import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../enum/animate_type.dart';

@immutable
class BouncingAnimation extends StatelessWidget {
  const BouncingAnimation({
    Key? key,
    required this.child,
    this.animateType = AnimateType.once,
    this.moveAmount = 100,
    this.durationMilliseconds = 1200,
    this.developerMode = false,
  }) : super(key: key);

  final Widget child;

  /// [animateType] is the type of animation to be played.
  ///
  /// [animateType.once] plays the animation once.
  /// [animateType.mirror] plays the animation once and then plays it in reverse.
  /// [animateType.loop] plays the animation in a loop.
  final AnimateType animateType;

  /// [moveAmount] is the amount of pixels the widget will move up and down.
  final double moveAmount;

  /// [durationMilliseconds] is the duration of the animation in milliseconds.
  ///
  /// [durationMilliseconds]'s 30% will be used for the hopping up animation duration.
  /// [durationMilliseconds]'s 70% will be used for the hopping down animation duration.
  final double durationMilliseconds;

  final bool developerMode;

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(
        'move',
        Tween<double>(begin: 0, end: -100),
        duration: Duration(milliseconds: (durationMilliseconds * 0.3).round()),
        curve: Curves.easeOutCirc,
      ).thenTween(
        'move',
        Tween<double>(begin: -100, end: 0),
        duration: Duration(milliseconds: (durationMilliseconds * 0.7).round()),
        curve: Curves.bounceOut,
      );

    return CustomAnimationBuilder<Movie>(
        control: animateType.getController,
        developerMode: developerMode,
        tween: tween,
        duration: tween.duration,
        child: child,
        builder: (context, value, child) {
          return Transform.translate(
            offset: Offset(0, value.get('move')),
            child: child,
          );
        });
  }
}
