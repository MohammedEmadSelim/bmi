import 'package:flutter/material.dart';

import 'package:bmi/screens/bmi_input_screen.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(child: Image.asset('assets/img.png')),
            Container(
              padding: EdgeInsets.all(30),
              decoration: BoxDecoration(
                color: Color(0xFF7E7ED2),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
              ),
              child: Column(
                children: [
                  Text(
                    "Know Your Body Better , Get Your BMI Score in Less Than a Minute!",
                    style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "It takes just 30 seconds – and your health is worth it!",
                    style: TextStyle(color: Colors.white70),
                  ),
                  Divider(color: Colors.white, height: 50),
                  ElevatedButton(
                    onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (c) => BmiInputScreen())),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF4C4C8D),
                      minimumSize: Size(double.infinity, 55),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    child: Text("Get Start", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}