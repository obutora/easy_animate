import 'package:easy_animate/animation/bouncing_animation.dart';
import 'package:flutter/material.dart';

import 'package:simple_animations/simple_animations.dart';
import 'package:easy_animate/mock/mock_box.dart';
import 'package:easy_animate/animation/pulse_animation.dart';
import 'package:easy_animate/animation/shake_animation.dart';

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
    'ShakeAnimation',
    'Four'
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
    case 'ShakeAnimation':
      return const ShakeAnimation(
        developerMode: false,
        child: MockBox(),
      );
    default:
      return const BouncingAnimation(
        child: MockBox(),
      );
  }
}
