import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../enum/animate_type.dart';

@immutable
class FluffyAnimation extends StatelessWidget {
  const FluffyAnimation({
    Key? key,
    required this.child,
    this.moveAmount = 16,
    this.durationMilliseconds = 5000,
    this.developerMode = false,
  }) : super(key: key);

  final Widget child;

  /// [moveAmount] is the amount of pixels the widget will move up and down.
  final double moveAmount;

  /// [durationMilliseconds] is the duration of the animation in milliseconds.
  ///
  /// [durationMilliseconds]'s 30% will be used for the hopping up animation duration.
  /// [durationMilliseconds]'s 70% will be used for the hopping down animation duration.
  final double durationMilliseconds;

  final bool developerMode;

  /// in the FluffyAnimation Widget, the [animateType] is always [AnimateType.mirror]
  ///
  /// Otherwise, it will not feel fluffy.
  final AnimateType animateType = AnimateType.mirror;

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(
        'move',
        Tween<double>(begin: moveAmount, end: -moveAmount),
        duration: Duration(milliseconds: (durationMilliseconds * 0.5).round()),
        curve: Curves.ease,
      ).thenTween(
        'move',
        Tween<double>(begin: -moveAmount, end: moveAmount),
        duration: Duration(milliseconds: (durationMilliseconds * 0.5).round()),
        curve: Curves.ease,
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
