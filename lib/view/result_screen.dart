import 'package:bmi/core/theme/colors.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(16)
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
                                "Samy Call",
                                style: TextStyle(
                                  color: AppColors.white,

                                  fontSize: 22,

                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 10,),
                              Text(
                                "A 23 years old male.",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 15,

                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Column(
                            children: [
                              Text(
                                "36.2",
                                style: TextStyle(
                                  color: AppColors.white,

                                  fontSize: 35,

                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(height: 6,),
                              Text(
                                "A 23 years old male.",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 18,

                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [

                          Column(
                            children: [
                              Text(
                                "180 CM",
                                style: TextStyle(
                                  color: AppColors.white,

                                  fontSize: 20,

                                  fontWeight: FontWeight.w700,
                                ),                              ),
                              SizedBox(height: 6,),
                              Text(
                                "Height",
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 18,

                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 12,),
                          SizedBox(
                            height: 55,
                            child: VerticalDivider(
                              color: AppColors.white,
                            ),
                          ),
                          SizedBox(width: 12,),
                          Column(
                            children: [
                              Text(
                                "70 Kg",
                                style: TextStyle(
                                  color: AppColors.white,

                                  fontSize: 20,

                                  fontWeight: FontWeight.w700,
                                ),                              ),
                              SizedBox(height: 6,),
                              Text(
                                "weight",
                                style: TextStyle(
                                  color: AppColors.white,
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
                  Image.asset('assets/images/Vector.png'),
                ],
              ),
            ),
            Container(),
            SizedBox(
              width: 300,
              height: 45,
              child: ElevatedButton(
                onPressed: () {
                  /// navigate to mew screen

                  Navigator.of(
                    context,
                  ).push(MaterialPageRoute(builder: (context) => ResultScreen()));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      16,
                    ), // Adjust the radius here
                  ),

                  backgroundColor: AppColors.darkPurple,
                ),
                child: Text(
                  "GCalculate BMI Again",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
