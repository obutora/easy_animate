import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class PulseAnimation extends StatelessWidget {
  const PulseAnimation({
    Key? key,
    required this.child,
    this.scaleAmount = 1.1,
    this.durationMilliseconds = 1200,
    this.developerMode = false,
  }) : super(key: key);

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

    return PlayAnimationBuilder<Movie>(
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
