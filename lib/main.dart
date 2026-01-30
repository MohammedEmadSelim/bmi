import 'package:bmi/calc_screen.dart';
import 'package:bmi/intro_screen.dart';
import 'package:bmi/result_screen.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: IntroScreen.routeName,
      routes: {
        IntroScreen.routeName : (_)=>IntroScreen(),
        CalcScreen.routeName : (_)=>CalcScreen(),
        ResultScreen.routeName : (_)=>ResultScreen(),
      },
    );
  }
}
