import 'package:easy_animate_example/screen/example_screen.dart';
import 'package:easy_animate_example/screen/scroll_example_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: <String, WidgetBuilder>{
        '/': (context) => const ExampleScreen(),
        '/scroll': (context) => const ScrollExampleScreen(),
      },
    );
  }
}
