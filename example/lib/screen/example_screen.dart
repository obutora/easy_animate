import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../widget/animation_selector.dart';

class ExampleScreen extends StatefulWidget {
  const ExampleScreen({super.key});

  @override
  State<ExampleScreen> createState() => _ExampleScreenState();
}

class _ExampleScreenState extends State<ExampleScreen> {
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
    return Scaffold(
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
              const SizedBox(height: 20),
              ElevatedButton(
                child: const Text('Move Scroll Animation'),
                onPressed: () {
                  Navigator.pushNamed(context, '/scroll');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
