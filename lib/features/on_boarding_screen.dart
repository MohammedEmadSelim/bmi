import 'package:bmi/core/app_const.dart';
import 'package:bmi/shared/custom_text_button.dart';
import 'package:bmi/features/bmi_form_screen.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 163, left: 27),
            child: Image.asset('assets/images/first_img.png'),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.lightBurble,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 45, left: 15),
                    child: Text(
                      'Know Your Body Better ,\nGet Your BMI Score in Less \nThan a Minute!',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 44),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      'It takes just 30 seconds – and your health is\n worth it!',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 43),
                  Center(
                    child: SizedBox(
                      width: 330,
                      child: Divider(
                        height: 0,
                        thickness: 2,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  CustomTextButton(
                    text: 'Get Started',
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
