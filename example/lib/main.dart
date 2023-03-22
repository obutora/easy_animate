import 'package:easy_animate/animation/bouncing_animation.dart';
import 'package:flutter/material.dart';

import 'package:simple_animations/simple_animations.dart';
import 'package:easy_animate/mock/mock_box.dart';
import 'package:easy_animate/animation/pulse_animation.dart';
import 'package:easy_animate/animation/shake_animation.dart';
import 'package:easy_animate/animation/fade_in_animation.dart';
import 'package:easy_animate/animation/slide_in_animation.dart';

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
    'PulseAnimation',
    'ShakeAnimation( isHorizontal : true)',
    'ShakeAnimation( isHorizontal : false)',
    'FadeInAnimation( FadeInAxis : none)',
    'FadeInAnimation( FadeInAxis : top)',
    'FadeInAnimation( FadeInAxis : right)',
    'FadeInAnimation( FadeInAxis : bottom)',
    'FadeInAnimation( FadeInAxis : left)',
    'SlideInAnimation ( SlideInAxis : left)',
  ];

  String selectedValue = 'BouncingAnimation';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
    case 'PulseAnimation':
      return const PulseAnimation(
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
    case 'FadeInAnimation( FadeInAxis : none)':
      return const FadeInAnimation(
        developerMode: true,
        fadeInAxis: FadeInAxis.none,
        child: MockBox(),
      );
    case 'FadeInAnimation( FadeInAxis : top)':
      return const FadeInAnimation(
        developerMode: true,
        fadeInAxis: FadeInAxis.top,
        child: MockBox(),
      );
    case 'FadeInAnimation( FadeInAxis : right)':
      return const FadeInAnimation(
        developerMode: true,
        fadeInAxis: FadeInAxis.right,
        child: MockBox(),
      );
    case 'FadeInAnimation( FadeInAxis : bottom)':
      return const FadeInAnimation(
        developerMode: true,
        fadeInAxis: FadeInAxis.bottom,
        child: MockBox(),
      );
    case 'FadeInAnimation( FadeInAxis : left)':
      return const FadeInAnimation(
        developerMode: true,
        fadeInAxis: FadeInAxis.left,
        child: MockBox(),
      );
    case 'SlideInAnimation ( SlideInAxis : left)':
      return const SlideInAnimation(
        developerMode: false,
        slideInAxis: SlideInAxis.left,
        child: MockBox(),
      );
    default:
      return const BouncingAnimation(
        developerMode: true,
        child: MockBox(),
      );
  }
}
