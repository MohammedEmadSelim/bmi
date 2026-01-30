import 'package:bmi/theme/color.dart';
import 'package:flutter/material.dart';

import 'info.dart';

class Calculate extends StatefulWidget {
  const Calculate({super.key});

  @override
  State<Calculate> createState() => _CalculateState();
}

class _CalculateState extends State<Calculate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child:Container(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text("BMI",style: TextStyle(
                    color: AppColors.green,
                    fontSize: 60,
                    fontWeight: FontWeight.bold
                  )),
              
                  Row(
                    children: [
                      Text("Name",style: TextStyle(
                        fontSize: 20,
                      ),textAlign: TextAlign.start,),
                    ],
                  ),
                  SizedBox(height: 10,),
                 _inputField(),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Birth Date",style: TextStyle(
                        fontSize: 20,
                      ),textAlign: TextAlign.start,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  _inputField(),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Choose Gender",style: TextStyle(
                        fontSize: 20,
                      ),textAlign: TextAlign.start,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                              Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.form,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset("assets/images/img_2.png"),
                                ),
                          ],
                        ),
                      ),
              
                      Expanded(
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: AppColors.form,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Image.asset("assets/images/img_3.png"),
                            ),
                          ],
                        ),
                      ),
              
                    ],
                  ),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Your Height(cm)",style: TextStyle(
                        fontSize: 20,
                      ),textAlign: TextAlign.start,),
                    ],
                  ),
                  SizedBox(height: 10,),
                 _inputField(),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Your Weight(kg)",style: TextStyle(
                        fontSize: 20,
                      ),textAlign: TextAlign.start,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  _inputField(),
                  SizedBox(height: 10,),

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultScreen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.darkPurple,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: const Text(
                        "Calculate BMI ",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ) ,
      ));
  }
}


Widget _inputField() {
  return TextField(
    decoration: InputDecoration(
      filled: true,
      fillColor: const Color(0xffE9EDFB),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
