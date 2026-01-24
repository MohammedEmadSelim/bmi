import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  static const String routeName = "IntroScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentGeometry.center,
        children: [
          Align(
            alignment: AlignmentGeometry.bottomCenter,
            child: Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xff7876CD),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    SizedBox(height: 46),
                    Text(
                      "Know Your Body Better ,Get Your BMI Score in Less Than a Minute!",
                      style: TextStyle(
                        color: Color(0xffFFFFFF),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 46),
                    Text(
                      "It takes just 30 seconds – and your health is worth it!",
                      style: TextStyle(
                        color: Color(0xffF8F9FF),
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    ),
                    SizedBox(height: 46),
                    Divider(
                      color: Color(0xffF8F9FF),
                      endIndent: 13,
                      indent: 13,
                    ),
                    SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xff484783),
                          padding: EdgeInsets.symmetric(vertical: 11),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Get Start",
                          style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 190,
            child: Image.asset(
              "assets/images/img_first_screen.png",
              height: 329.4,
              width: 334.36,
            ),
          ),
        ],
      ),
    );
  }
}
