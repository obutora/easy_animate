import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../enum/animate_type.dart';

class ShakeAnimation extends StatelessWidget {
  const ShakeAnimation({
    super.key,
    this.animateType = AnimateType.once,
    this.moveAmount = 16,
    this.durationMilliseconds = 60,
    this.isHorizontal = true,
    this.developerMode = false,
    required this.child,
  });

  final Widget child;

  /// [animateType] is the type of animation to be played.
  ///
  /// [animateType.once] plays the animation once.
  /// [animateType.mirror] plays the animation once and then plays it in reverse.
  /// [animateType.loop] plays the animation in a loop.
  final AnimateType animateType;

  /// [moveAmount] is the amount of pixels the widget.
  final double moveAmount;

  /// [durationMilliseconds] is the duration of the animation in milliseconds.
  final double durationMilliseconds;

  final bool isHorizontal;

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

    return CustomAnimationBuilder(
      developerMode: developerMode,
      control: animateType.getController,
      tween: tween,
      duration: tween.duration,
      child: child,
      builder: (context, value, child) {
        return Transform.translate(
          offset: Offset(
            isHorizontal ? value.get('shake') : 0,
            isHorizontal ? 0 : value.get('shake'),
          ),
          child: child,
        );
      },
    );
  }
}
