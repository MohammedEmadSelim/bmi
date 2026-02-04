import 'package:bmi/core/colors.dart';
import 'package:bmi/models/bmi_model.dart';
import 'package:bmi/screens/calculate_page.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({
    super.key,
    required this.bmiModel,
    required this.name,
    required this.birth,
  });

  final BmiModel bmiModel;
  final String name;
  final String birth;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.primary,
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
                                    color: AppColors.white,

                                    fontSize: 22,

                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  birth,
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
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  bmiModel.bmiDate.bmi.toStringAsFixed(3),
                                  style: TextStyle(
                                    color: AppColors.white,

                                    fontSize: 35,

                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 6),
                                Text(
                                  bmiModel.bmiDate.risk,
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
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Column(
                              children: [
                                Text(
                                  bmiModel.bmiDate.height,
                                  style: TextStyle(
                                    color: AppColors.white,

                                    fontSize: 20,

                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 6),
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
                            SizedBox(width: 12),
                            SizedBox(
                              height: 55,
                              child: VerticalDivider(color: AppColors.white),
                            ),
                            SizedBox(width: 12),
                            Column(
                              children: [
                                Text(
                                  bmiModel.bmiDate.weight,
                                  style: TextStyle(
                                    color: AppColors.white,

                                    fontSize: 20,

                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                SizedBox(height: 6),
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
                    Image.asset('assets/images/body.png'),
                  ],
                ),
              ),
              SizedBox(height: 24),

              Container(
                padding: EdgeInsets.symmetric(vertical: 35, horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bmiModel.bmiDate.risk,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 22,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      bmiModel.bmiDate.summary,
                      overflow: TextOverflow.ellipsis,

                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 4),

                    Text(
                      bmiModel.bmiDate.recommendation,
                      // overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 29.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CalculatePage())
                      );},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),

                      ),

                      backgroundColor: AppColors.deepPurpel,
                    ),
                    child: Text(
                      "Calculate BMI Again",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
