import 'package:bmi/view/screens/onboardingscrreen.dart';
import 'package:bmi/view_model/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BmiCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: ' BMI',
        initialRoute: '/',
        routes: {
          '/': (context) => const OnBoardingScreen(),
        },
      ),
    );
  }
}