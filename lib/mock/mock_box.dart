import 'package:flutter/material.dart';

class MockBox extends StatelessWidget {
  const MockBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: Colors.indigoAccent,
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }
}
