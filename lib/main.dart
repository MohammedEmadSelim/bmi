<<<<<<< HEAD



import 'package:abdoapp/calc_screen.dart';
import 'package:abdoapp/result_screen.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'intro_screen.dart';

void main(){
  runApp(MyApp());
=======
import 'package:flutter/material.dart';
import 'screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
>>>>>>> 16257a0 (Finish BMI Task)
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< HEAD
      initialRoute: IntroScreen.routeName,
      routes: {
        IntroScreen.routeName : (_)=>IntroScreen(),
        CalcScreen.routeName : (_)=>CalcScreen(),
        ResultScreen.routeName : (_)=>ResultScreen(),
      },
    );
  }
}
=======
      home: WelcomeScreen(),
    );
  }
}
>>>>>>> 16257a0 (Finish BMI Task)
