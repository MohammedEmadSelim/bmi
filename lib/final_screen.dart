import 'package:bmi/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:bmi/widgets/result_first_card.dart';
import 'package:bmi/widgets/second_card.dart';
import 'package:bmi/widgets/result_button.dart';




class FinalScreen extends StatelessWidget {
  const FinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ResultFirstCard(),
            SizedBox(height: 15,),
            SecondCard(),
            SizedBox( height: 25,),
            ResultButton()
          ],
        ),
      ),
    );
  }
}
