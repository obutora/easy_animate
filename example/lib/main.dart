import 'package:easy_animate/animation/bouncing_animation.dart';
import 'package:easy_animate/enum/animate_direction.dart';
import 'package:flutter/material.dart';

import 'package:simple_animations/simple_animations.dart';
import 'package:easy_animate/mock/mock_box.dart';
import 'package:easy_animate/animation/pulse_animation.dart';
import 'package:easy_animate/animation/shake_animation.dart';
import 'package:easy_animate/animation/scale_in_animation.dart';
import 'package:easy_animate/animation/fade_in_animation.dart';
import 'package:easy_animate/animation/fade_out_animation.dart';
import 'package:easy_animate/animation/slide_in_animation.dart';
import 'package:easy_animate/animation/stamp_in_animation.dart';
import 'package:easy_animate/animation/fluffy_animation.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> list = <String>[
    'BouncingAnimation',
    'ScaleInAnimation',
    'StampInAnimation',
    'ShakeAnimation( isHorizontal : true)',
    'ShakeAnimation( isHorizontal : false)',
    'FadeInAnimation( animateDirection : none)',
    'FadeInAnimation( animateDirection : top)',
    'FadeInAnimation( animateDirection : right)',
    'FadeInAnimation( animateDirection : bottom)',
    'FadeInAnimation( animateDirection : left)',
    'FadeOutAnimation( animateDirection : none)',
    'FadeOutAnimation( animateDirection : top)',
    'FadeOutAnimation( animateDirection : right)',
    'FadeOutAnimation( animateDirection : bottom)',
    'FadeOutAnimation( animateDirection : left)',
    'SlideInAnimation ( animateDirection : left)',
    'PulseAnimation',
    'FluffyAnimation',
  ];

  String selectedValue = 'BouncingAnimation';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: AnimationDeveloperTools(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(child: animationSelector(selectedValue)),
                const SizedBox(height: 40),
                DropdownButton(
                  value: selectedValue,
                  items: list
                      .map<DropdownMenuItem<String>>((String dropButtonValue) {
                    return DropdownMenuItem<String>(
                      value: dropButtonValue,
                      child: Text(dropButtonValue),
                    );
                  }).toList(),
                  onChanged: ((String? value) {
                    setState(() {
                      selectedValue = value!;
                    });
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget animationSelector(String selectedValue) {
  switch (selectedValue) {
    case 'BouncingAnimation':
      return const BouncingAnimation(
        developerMode: true,
        child: MockBox(),
      );

    case 'ScaleInAnimation':
      return const ScaleInAnimation(
        developerMode: true,
        child: MockBox(),
      );
    case 'StampInAnimation':
      return const StampInAnimation(
        developerMode: true,
        child: MockBox(),
      );
    case 'ShakeAnimation( isHorizontal : true)':
      return const ShakeAnimation(
        developerMode: true,
        isHorizontal: true,
        child: MockBox(),
      );
    case 'ShakeAnimation( isHorizontal : false)':
      return const ShakeAnimation(
        developerMode: true,
        isHorizontal: false,
        child: MockBox(),
      );
    case 'FadeInAnimation( animateDirection : none)':
      return const FadeInAnimation(
        developerMode: true,
        animateDirection: AnimateDirection.none,
        child: MockBox(),
      );
    case 'FadeInAnimation( animateDirection : top)':
      return const FadeInAnimation(
        developerMode: true,
        animateDirection: AnimateDirection.top,
        child: MockBox(),
      );
    case 'FadeInAnimation( animateDirection : right)':
      return const FadeInAnimation(
        developerMode: true,
        animateDirection: AnimateDirection.right,
        child: MockBox(),
      );
    case 'FadeInAnimation( animateDirection : bottom)':
      return const FadeInAnimation(
        developerMode: true,
        animateDirection: AnimateDirection.bottom,
        child: MockBox(),
      );
    case 'FadeInAnimation( animateDirection : left)':
      return const FadeInAnimation(
        developerMode: true,
        animateDirection: AnimateDirection.left,
        child: MockBox(),
      );
    case 'SlideInAnimation ( animateDirection : left)':
      return const SlideInAnimation(
        developerMode: true,
        animateDirection: AnimateDirection.left,
        child: MockBox(),
      );
    case 'FadeOutAnimation( animateDirection : none)':
      return const FadeOutAnimation(
        developerMode: true,
        animateDirection: AnimateDirection.none,
        child: MockBox(),
      );
    case 'FadeOutAnimation( animateDirection : top)':
      return const FadeOutAnimation(
        developerMode: true,
        animateDirection: AnimateDirection.top,
        child: MockBox(),
      );
    case 'FadeOutAnimation( animateDirection : right)':
      return const FadeOutAnimation(
        developerMode: true,
        animateDirection: AnimateDirection.right,
        child: MockBox(),
      );
    case 'FadeOutAnimation( animateDirection : bottom)':
      return const FadeOutAnimation(
        developerMode: true,
        animateDirection: AnimateDirection.bottom,
        child: MockBox(),
      );
    case 'FadeOutAnimation( animateDirection : left)':
      return const FadeOutAnimation(
        developerMode: true,
        animateDirection: AnimateDirection.left,
        child: MockBox(),
      );
    case 'PulseAnimation':
      return const PulseAnimation(
        developerMode: true,
        child: MockBox(),
      );
    case 'FluffyAnimation':
      return const FluffyAnimation(
        developerMode: false,
        child: MockBox(),
      );
    default:
      return const BouncingAnimation(
        developerMode: true,
        child: MockBox(),
      );
  }
}
