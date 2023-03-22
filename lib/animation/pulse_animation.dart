import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../enum/animate_type.dart';

class PulseAnimation extends StatelessWidget {
  const PulseAnimation({
    Key? key,
    required this.child,
    this.animateType = AnimateType.once,
    this.scaleAmount = 1.1,
    this.durationMilliseconds = 1200,
    this.developerMode = false,
  }) : super(key: key);

  /// [animateType] is the type of animation to be played.
  ///
  /// [animateType.once] plays the animation once.
  /// [animateType.mirror] plays the animation once and then plays it in reverse.
  /// [animateType.loop] plays the animation in a loop.
  final AnimateType animateType;

  /// [scaleAmount] is the amount of ratio.
  final double scaleAmount;

  /// [durationMilliseconds] is the duration of the animation in milliseconds.
  ///
  /// [durationMilliseconds]'s 50% will be used for the scaling up animation duration.
  /// [durationMilliseconds]'s 50% will be used for the scaling down animation duration.
  final double durationMilliseconds;

  final Widget child;
  final bool developerMode;

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(
        'pulse',
        Tween<double>(begin: 1, end: scaleAmount),
        duration: Duration(milliseconds: (durationMilliseconds / 2).round()),
        curve: Curves.easeInOut,
      ).thenTween(
        'pulse',
        Tween<double>(begin: scaleAmount, end: 1),
        duration: Duration(milliseconds: (durationMilliseconds / 2).round()),
        curve: Curves.easeInOut,
      );

    return CustomAnimationBuilder<Movie>(
      control: animateType.getController,
      tween: tween,
      duration: tween.duration,
      developerMode: developerMode,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value.get('pulse'),
          child: child,
        );
      },
      child: child,
    );
  }
}
