


import 'package:abdoapp/calc_screen.dart';
import 'package:abdoapp/result_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'intro_screen.dart';

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