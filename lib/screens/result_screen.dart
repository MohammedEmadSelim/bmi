import 'package:flutter/material.dart';
import '../model/bmi_model.dart';

class ResultScreen extends StatelessWidget {
  final String name;
  final String gender;
  final int height, weight;
  final BmiModel result;

  ResultScreen({
    required this.name,
    required this.gender,
    required this.height,
    required this.weight,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(size.width * 0.05),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(size.width * 0.06),
                decoration: BoxDecoration(
                  color: const Color(0xFF7E7ED2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            name,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "A 23 years old $gender.",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: size.width * 0.035,
                            ),
                          ),
                          SizedBox(height: size.height * 0.02),
                          Text(
                            result.bmi.toStringAsFixed(1),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: size.width * 0.1,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            "BMI Calc",
                            style: TextStyle(color: Colors.white70),
                          ),
                          SizedBox(height: size.height * 0.02),
                          IntrinsicHeight(
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "$height cm",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      "Height",
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                  ],
                                ),
                                const VerticalDivider(
                                  color: Colors.white,
                                  thickness: 1,
                                  indent: 5,
                                  endIndent: 5,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "$weight kg",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const Text(
                                      "Weight",
                                      style: TextStyle(color: Colors.white70),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        'assets/body.png',
                        height: size.height * 0.2,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                padding: EdgeInsets.all(size.width * 0.05),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color(0xFF0D4D3F),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      result.label,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.055,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Text(
                      "Your BMI is ${result.bmi < 18.5 ? 'less than 18.5' : 'in range'}",
                      style: const TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: size.height * 0.02),
                    Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sagittis interdum dui enim imperdiet sapien cursus velit pharetra. Viverra justo tempor dictum odio.",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: size.width * 0.035,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.05),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4C4C8D),
                  minimumSize: Size(double.infinity, size.height * 0.07),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: const Text(
                  "Calculate BMI Again",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}