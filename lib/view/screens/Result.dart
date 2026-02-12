import 'package:bmi/core/theme/colors.dart';
import 'package:bmi/view/screens/calc_screen.dart';
import 'package:flutter/material.dart';
import 'package:bmi/models/bmi_model.dart';
import 'package:bmi/view_model/repo.dart';

class Result extends StatelessWidget {
  final String name;
  final BmiModel bmi_model;
  final String birth;
  const Result({
    super.key,
    required this.bmi_model,
    required this.name,
    required this.birth,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: ColorsUsed.firstPurple,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    name,
                                    style: TextStyle(
                                      color: Colors.white,

                                      fontSize: 22,

                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    birth,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,

                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    bmi_model.bmiData.bmi.toStringAsFixed(3),
                                    style: TextStyle(
                                      color: Colors.white,

                                      fontSize: 35,

                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    bmi_model.bmiData.risk,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,

                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    bmi_model.bmiData.height,
                                    style: TextStyle(
                                      color: Colors.white,

                                      fontSize: 20,

                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "Height",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,

                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 12),
                              SizedBox(
                                height: 55,
                                child: VerticalDivider(color: Colors.white),
                              ),
                              SizedBox(width: 12),
                              Column(
                                children: [
                                  Text(
                                    bmi_model.bmiData.weight,
                                    style: TextStyle(
                                      color: Colors.white,

                                      fontSize: 20,

                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(height: 6),
                                  Text(
                                    "weight",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,

                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      Image.asset('assets/images/body .png'),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: ColorsUsed.deepgree,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          bmi_model.bmiData.risk,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          bmi_model.bmiData.summary,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 3),
                        Text(
                          bmi_model.bmiData.recommendation,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 5),
                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CalcScreen()),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsUsed.deepPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),

                    child: const Text(
                      "Calculate BMI Again",
                      style: TextStyle(
                        color: Colors.white,
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
    );
  }
}
