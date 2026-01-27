import 'package:bmi/features/bmi_form_screen.dart';
import 'package:bmi/features/on_boarding_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => const OnBoardingScreen(),
        '/home': (context) => const HomeScreen(),
      },
    );
  }
}
