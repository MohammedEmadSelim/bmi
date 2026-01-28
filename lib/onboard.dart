import 'package:bmi/info.dart';
import 'package:bmi/theme/color.dart';
import 'package:flutter/material.dart';

class onboarding extends StatelessWidget {
  const onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar(

        ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 70,),
            Image.asset("assets/images/img.png"),
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 430,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                  ),
                  )
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Know Your Body Better ,Get Your BMI Score in Less Than a Minute!",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 20,left: 20,top: 200,bottom: 100),
                  child: Text("Know Your Body Better ,Get Your BMI Score in Less Than a Minute!",
                  style: TextStyle(
                    color: AppColors.white,
                    fontSize: 15,
                    ),)
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 300,right: 20,left: 20),
                  child: Container(
                    width: 350,
                    height: 2,
                    color: AppColors.white,
                  ),
                ),
                Padding(padding: EdgeInsets.only(top: 320,right: 20,left: 20),
                child:ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>information()));
                },
                    child: Text("Get Started",
                    style: TextStyle(
                      color: AppColors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(350, 50),
                  backgroundColor: AppColors.darkPurple,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),) ,
                )
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
