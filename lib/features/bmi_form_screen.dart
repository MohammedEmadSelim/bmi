import 'package:bmi/core/app_const.dart';
import 'package:bmi/shared/custom_text_button.dart';
import 'package:bmi/shared/custom_text_field.dart';
import 'package:bmi/features/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 75,),
            Image.asset('assets/images/BMI.png'),
            SizedBox(height: 35,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CustomTextField(),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'Birth Date',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                CustomTextField(),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'Choose Gender',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xffEBEDFC),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset('assets/images/male.png'),
                        ),
                        Text('Male',style: TextStyle(color: Colors.black87,fontSize: 16),)
                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Color(0xffEBEDFC),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Image.asset('assets/images/female.png'),
                        ),
                        Text('Female',style: TextStyle(color: Colors.black87,fontSize: 16),)
                      ],
                    )
                  ],
                ),
                SizedBox(height: 53,),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'Your Height(cm)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.primary,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.remove),
                      suffixIcon: Icon(Icons.add),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'Your Weight(kg)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 25,right: 25),
                  child: TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.primary,
                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(Icons.remove),
                      suffixIcon: Icon(Icons.add),
                    ),
                  ),
                ),
                SizedBox(height: 40,),
                CustomTextButton(text: 'Calculate BMI', onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => BmiResultScreen()),
                  );
                },)
              ],
            )

          ],
        ),
      ),
    );
  }
}
