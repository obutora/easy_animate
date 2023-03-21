import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

class ShakeAnimation extends StatelessWidget {
  const ShakeAnimation({
    super.key,
    this.moveAmount = 16,
    this.durationMilliseconds = 60,
    this.developerMode = false,
    required this.child,
  });

  final Widget child;

  final double moveAmount;
  final double durationMilliseconds;

  final bool developerMode;

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(
        'shake',
        Tween<double>(begin: 0, end: moveAmount),
        duration: Duration(milliseconds: durationMilliseconds.toInt()),
        curve: Curves.easeInOut,
      )
          .thenTween(
            'shake',
            Tween<double>(begin: moveAmount, end: -moveAmount),
            duration:
                Duration(milliseconds: (1.3 * durationMilliseconds).round()),
            curve: Curves.easeInOut,
          )
          .thenTween(
            'shake',
            Tween<double>(begin: -moveAmount, end: 1.6 * moveAmount),
            duration:
                Duration(milliseconds: (1.3 * durationMilliseconds).round()),
            curve: Curves.easeInOut,
          )
          .thenTween(
            'shake',
            Tween<double>(begin: 1.6 * moveAmount, end: -moveAmount),
            duration:
                Duration(milliseconds: (1.3 * durationMilliseconds).round()),
            curve: Curves.easeInOut,
          )
          .thenTween(
            'shake',
            Tween<double>(begin: -moveAmount, end: moveAmount),
            duration:
                Duration(milliseconds: (1.3 * durationMilliseconds).round()),
            curve: Curves.easeInOut,
          )
          .thenTween(
            'shake',
            Tween<double>(begin: moveAmount, end: 0),
            duration: Duration(milliseconds: durationMilliseconds.toInt()),
            curve: Curves.easeInOut,
          );

    return PlayAnimationBuilder(
      developerMode: developerMode,
      tween: tween,
      duration: tween.duration,
      child: child,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(value.get('shake'), 0),
          child: child,
        );
      },
    );
  }
}
