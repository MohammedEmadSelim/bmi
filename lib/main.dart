import 'package:bmi/ResultPage.dart';
import 'package:flutter/material.dart';
import 'core/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: OnBoarding(),
      // home: BmiResultPage(),
    );
  }
}

class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Image.asset('assets/images/first_img.png',
              fit: BoxFit.contain,
              ),
            ),
          ),

          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
              color: AppColors.primary,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Know Your Body Better,\nGet Your BMI Score in Less Than a Minute!',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 22,
                      height: 1.4,
                      color: AppColors.white,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'It takes just 30 seconds – and your health is worth it!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 15,
                      height: 1.5,
                      color: AppColors.greyWhite,
                    ),
                  ),

                  Divider(
                    color: Colors.grey,
                  ),

                  const SizedBox(height: 20),

                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkPurple,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        "Get Start",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
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
    );
  }
}
