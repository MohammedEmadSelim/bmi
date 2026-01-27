import 'package:bmi/core/app_const.dart';
import 'package:bmi/shared/custom_text_button.dart';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  final double height;
  final double weight;
  final String name;
  final DateTime birthDate;
  final String gender;
  const BmiResultScreen({
    super.key,
    required this.height,
    required this.weight,
    required this.name,
    required this.birthDate,
    required this.gender,
  });
  int calculateAge(DateTime birthDate) {
    final DateTime today = DateTime.now();
    int age = today.year - birthDate.year;
    if (today.month < birthDate.month ||
        (today.month == birthDate.month && today.day < birthDate.day)) {
      age--;
    }
    return age;
  }

  double bmiCalculation(double height, double weight) {
    final heightMeter = height / 100;
    return weight / (heightMeter * heightMeter);
  }

  String getBmiStatus(double bmi) {
    if (bmi < 18.5) {
      return 'Under Weight';
    } else if (bmi < 25) {
      return 'Normal';
    } else if (bmi < 30) {
      return 'Over Weight';
    } else {
      return 'Obese';
    }
  }

  String getBmiDescription(double bmi) {
    if (bmi < 18.5) {
      return 'Your BMI is less than 18.5';
    } else if (bmi < 25) {
      return 'Your BMI is between 18.5 and 24.9';
    } else if (bmi < 30) {
      return 'Your BMI is between 25 and 29.9';
    } else {
      return 'Your BMI is 30 or more';
    }
  }

  @override
  Widget build(BuildContext context) {
    final int age = calculateAge(birthDate);
    final double bmiCalc = bmiCalculation(height, weight);
    final String bmiStatus = getBmiStatus(bmiCalc);
    final String bmiDescription = getBmiDescription(bmiCalc);

    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 97, left: 20, right: 20),
              child: Container(
                width: 350,
                height: 298,
                decoration: BoxDecoration(
                  color: AppColors.lightBurble,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 43, left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 10),

                          Text(
                            'A $age years old $gender.',
                            style: TextStyle(fontSize: 15, color: Colors.white),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 40, top: 20),
                            child: Text(
                              bmiCalc.toStringAsFixed(1),
                              style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 40,
                              bottom: 10,
                            ),
                            child: Text(
                              'BMI Calc',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '$height cm',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Height',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 45,
                                child: VerticalDivider(
                                  width: 30,
                                  thickness: 2,
                                  color: Colors.white,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    '$weight kg',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Weight',
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 50),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Image.asset('assets/images/Vector.png'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 25),
            Container(
              width: 350,
              height: 320,
              decoration: BoxDecoration(
                color: AppColors.darkGreen,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20, top: 26),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      bmiStatus,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Text(
                        bmiDescription,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Text(
                        'Lorem ipsum dolor sit amet consectetur. Sagittis interdum dui enim imperdiet sapien cursus velit pharetra. Viverra justo tempor dictum odio. Nisl non dui integer orci nulla eget laoreet tellus. Orci nunc a orci convallis ac orci. Urna auctor at elementum sit ante maecenas ullamcorper rhoncus dictum. Morbi venenatis lectus ultrices euismod. Laoreet purus risus amet enim sagittis ut. Consectetur libero orci urnager dignissi est.',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 45),
            CustomTextButton(
              text: 'Calculate BMI Again',
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/home');
              },
            ),
          ],
        ),
      ),
    );
  }
}
