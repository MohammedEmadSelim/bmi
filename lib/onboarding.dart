import 'package:flutter/material.dart';
import 'package:bmi/widgets/onboarding_image.dart';
import 'package:bmi/widgets/onboarding_card.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment .center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          OnboardingImage(),
            SizedBox(height: 5,)
            , OnboardingCard()
          ],
        ),
      ),
    );
  }
}
