import 'package:bmi/info.dart';
import 'package:bmi/theme/color.dart';
import 'package:flutter/material.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 40),
            Expanded(
              flex: 6,
              child: Image.asset(
                "assets/images/img.png",
                fit: BoxFit.contain,
              ),
            ),

            Expanded(
              flex: 5,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Know Your Body Better\nGet Your BMI Score in Less Than a Minute!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    Text(
                      "Track your health easily and understand your body metrics in seconds.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.white,
                        fontSize: 15,
                      ),
                    ),

                    Container(
                      height: 2,
                      width: double.infinity,
                      color: AppColors.white,
                    ),

                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ResultScreen()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.darkPurple,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Get Started",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
