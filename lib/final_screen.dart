import 'package:flutter/material.dart';
import 'package:bmi/widgets/result_first_card.dart';
import 'package:bmi/widgets/second_card.dart';
import 'package:bmi/widgets/result_button.dart';

class FinalScreen extends StatelessWidget {
  final String name;
  final String bmiValue;
  final String status;
  final int height;
  final int weight;
  final String gender;

  const FinalScreen({
    super.key,
    required this.name,
    required this.bmiValue,
    required this.status,
    required this.height,
    required this.weight,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FC),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ResultFirstCard(
                name: name,
                age: '23',
                gender: gender,
                bmiScore: bmiValue,
                height: height.toString(),
                weight: weight.toString(),
              ),
              const SizedBox(height: 25),

              SecondCard(status: status),

              const Spacer(),

              ResultButton(
                btnText: "Calculate BMI Again",
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
