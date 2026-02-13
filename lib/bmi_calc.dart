import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bmi/cubit/bmi_cubit.dart';
import 'package:bmi/cubit/bmi_state.dart';
import 'package:bmi/final_screen.dart';

import 'widgets/bmi_header.dart';
import 'widgets/bmi_text_field.dart';
import 'widgets/gender_selector.dart';
import 'widgets/height_selector.dart';
import 'widgets/weight_selector.dart';
import 'widgets/calculate_button.dart';

class BmiCalc extends StatefulWidget {
  const BmiCalc({super.key});

  @override
  State<BmiCalc> createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {
  bool isMale = true;
  int height = 170;
  int weight = 70;

  final name = TextEditingController();
  final birthDate = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FC),
      body: SafeArea(
        child: BlocListener<BmiCubit, BmiState>(
          listener: (context, state) {
            if (state is BmiSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => FinalScreen(
                    name: name.text,
                    bmiValue: state.bmi,
                    status: state.health,
                    height: height,
                    weight: weight,
                    gender: isMale ? "male" : "female",
                  ),
                ),
              );
            }
          },
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const BmiHeader(),

                BmiTextField(label: "Name", controller: name),
                const SizedBox(height: 20),

                BmiTextField(label: "Age", controller: birthDate),
                const SizedBox(height: 20),

                GenderSelector(
                  isMale: isMale,
                  onChanged: (value) {
                    setState(() => isMale = value);
                  },
                ),
                const SizedBox(height: 20),

                HeightSelector(
                  height: height,
                  onChanged: (value) {
                    setState(() => height = value);
                  },
                ),
                const SizedBox(height: 20),

                WeightSelector(
                  weight: weight,
                  onChanged: (value) {
                    setState(() => weight = value);
                  },
                ),
                const SizedBox(height: 40),

                CalculateButton(
                  weight: weight,
                  height: height,
                  isMale: isMale,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
