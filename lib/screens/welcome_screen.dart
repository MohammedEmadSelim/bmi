import 'package:flutter/material.dart';
import 'input_screen.dart';
import 'app_colors.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset("assets/images/firstScr_image.png"),
          SizedBox(height: 120),
          Container(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: EdgeInsets.all(21),
              child: Column(
                children: [
                  Text(
                    'Know Your Body Better ,Get Your BMI Score in Less Than a Minute!',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      color: AppColors.black,
                    ),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'It takes just 30 seconds – and your health is worth it!',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors.greyWhite,
                    ),
                  ),
                  Divider(),
                  SizedBox(height: 24),
                  SizedBox(
                    width: 300,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => InputScreen(),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        backgroundColor: AppColors.darkPurple,
                      ),
                      child: Text(
                        "Get Start",
                        style: TextStyle(color: Colors.white),
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
