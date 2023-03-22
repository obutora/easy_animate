import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../enum/animate_type.dart';

class StampInAnimation extends StatelessWidget {
  const StampInAnimation({
    super.key,
    required this.child,
    this.animateType = AnimateType.once,
    this.durationMilliseconds = 600,
    this.initScale = 1.8,
    this.developerMode = false,
  });

  final Widget child;

  /// [animateType] is the type of animation to be played.
  ///
  /// [animateType.once] plays the animation once.
  /// [animateType.mirror] plays the animation once and then plays it in reverse.
  /// [animateType.loop] plays the animation in a loop.
  final AnimateType animateType;

  /// [durationMilliseconds] is the duration of the animation in milliseconds.
  final double durationMilliseconds;

  /// [initScale] is the initial scale of the widget.
  ///
  /// This is used to scale the widget to a larger size before scaling it back down.
  final double initScale;

  final bool developerMode;

  @override
  Widget build(BuildContext context) {
    final tween = MovieTween()
      ..tween(
        'scale',
        Tween<double>(begin: initScale, end: 1),
        duration: Duration(milliseconds: durationMilliseconds.toInt()),
        curve: Curves.bounceOut,
      )
      ..tween('opacity', Tween<double>(begin: 0, end: 1),
          duration:
              Duration(milliseconds: (durationMilliseconds * 0.66).toInt()),
          curve: Curves.easeOut);

    return CustomAnimationBuilder(
      control: animateType.getController,
      tween: tween,
      duration: tween.duration,
      developerMode: developerMode,
      builder: ((context, value, child) {
        return Transform.scale(
          scale: value.get('scale'),
          child: Opacity(
            opacity: value.get('opacity'),
            child: child,
          ),
        );
      }),
      // onCompleted: ,
      child: child,
    );
  }
}
