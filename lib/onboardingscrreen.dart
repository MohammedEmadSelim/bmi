import 'package:bmi/bmi_form.dart';
import 'package:bmi/core/app_color.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/first_img.png'),
          Center(
            child: Container(
              width: 390,
              height: 376,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: AppColor.purple0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 14.25,top: 45.3),
                    child: Text(
                      'Know Your Body Better ,',
                      style: TextStyle(fontSize: 24,
                          fontWeight: FontWeight.w700,
                      color: AppColor.white0,),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 14.25,bottom: 30 ),
                    child: Text(
                      'Get Your BMI Score in Less   Than a Minute!',
                      style: TextStyle(fontSize: 24,
                          fontWeight: FontWeight.w500,
                          color: AppColor.white0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 14.25,bottom: 10),
                    child: Text(
                      'it takes just 30 seconds - and your health is worth it!',
                      style: TextStyle(fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: AppColor.gray1),
                    ),
                  ),
                  Divider(
                    height: 20 ,
                    thickness: 2.5,
                    indent: 30,
                    endIndent: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 29,right: 29,bottom: 42,top: 10),
                    child: Container(
                      width: 332,
                      height: 45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.purple1,
                      ),

                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => BmiForm()),
                          );
                        },
                        child: Text(
                          'Get Start',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.5,
                            color: Colors.white,
                          ),
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

