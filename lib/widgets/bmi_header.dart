import 'package:flutter/material.dart';

class BmiHeader extends StatelessWidget {
  const BmiHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 30),
        Text(
          'BMI',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1B5E20),
          ),
        ),
        SizedBox(height: 30),
      ],
    );
  }
}
