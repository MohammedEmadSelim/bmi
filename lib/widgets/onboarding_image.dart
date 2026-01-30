import 'package:flutter/material.dart';

class OnboardingImage extends StatelessWidget {
  const OnboardingImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/img.png",
      fit: BoxFit.contain,
    ) ;
  }
}
