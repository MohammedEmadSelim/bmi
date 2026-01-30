import 'package:flutter/material.dart';

class CalcScreen extends StatelessWidget {
  const CalcScreen({super.key});

  static const String routeName = "CalcScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF5F8FF),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          spacing: 10,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 65),
            Center(
              child: Text(
                "BMI",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff01502E).withValues(alpha: 10),
                ),
              ),
            ),
            textWidget("Name"),
            reusableTextFiled(),
            SizedBox(height: 10),
            textWidget("Birth Date"),
            reusableTextFiled(),
            SizedBox(height: 10),
            textWidget("Choose Gender"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  spacing: 10,
                  children: [
                    Image.asset("assets/images/male.png"),
                    Text(
                      "Male",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333).withValues(alpha: 15),
                      ),
                    ),
                  ],
                ),
                Column(
                  spacing: 10,
                  children: [
                    Image.asset("assets/images/female.png"),
                    Text(
                      "Female",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Color(0xff333333).withValues(alpha: 15),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10),
            textWidget("Your Height(cm)"),
            reusableTextFiled(
              suffixIcon: Icon(Icons.add, size: 20, color: Color(0xff484783)),
              prefixIcon: Icon(
                Icons.remove,
                size: 20,
                color: Color(0xff484783),
              ),
            ),
            SizedBox(height: 10),
            textWidget("Your Weight(kg)"),
            reusableTextFiled(
              suffixIcon: Icon(Icons.add, size: 20, color: Color(0xff484783)),
              prefixIcon: Icon(
                Icons.remove,
                size: 20,
                color: Color(0xff484783),
              ),
            ),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4),
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff484783),
                  padding: EdgeInsets.symmetric(vertical: 11),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                },
                child: Text(
                  "Calculate BMI",
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
    );
  }

  Widget reusableTextFiled({Widget? prefixIcon, Widget? suffixIcon}) {
    return TextField(
      style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Color(0x26b3b2ea),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color(0xff414073).withValues(alpha: 89),
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color(0xff414073).withValues(alpha: 89),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Color(0xff414073).withValues(alpha: 89),
          ),
        ),
      ),
    );
  }

  Widget textWidget(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Color(0xD9333333),
      ),
    );
  }
}
