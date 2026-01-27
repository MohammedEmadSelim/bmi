import 'package:bmi/core/app_const.dart';
import 'package:bmi/shared/custom_text_button.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 500,
            left: 0,
            right: 0,
            bottom: 0,
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
                  const SizedBox(height: 45),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'Know Your Body Better ,\n'
                      'Get Your BMI Score in Less \n'
                      'Than a Minute!',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 44),
                  const Padding(
                    padding: EdgeInsets.only(left: 15),
                    child: Text(
                      'It takes just 30 seconds – and your health is\n worth it!',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 43),
                  Center(
                    child: SizedBox(
                      width: 330,
                      child: Divider(thickness: 2, color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 24),
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
          Positioned(
            top: 170,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/first_img.png',
              fit: BoxFit.contain,
              width: 330,
              height: 360,
            ),
          ),
        ],
      ),
    );
  }
}
