import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/bmi_cubit.dart';
import '../cubit/bmi_state.dart';

class CalculateButton extends StatelessWidget {
  final int weight;
  final int height;
  final bool isMale;

  const CalculateButton({
    super.key,
    required this.weight,
    required this.height,
    required this.isMale,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiCubit, BmiState>(
      builder: (context, state) {
        return SizedBox(
          width: double.infinity,
          height: 55,
          child: ElevatedButton(
            onPressed: state is BmiLoading
                ? null
                : () {
              context.read<BmiCubit>().calBMI(
                weight: weight.toDouble(),
                height: height.toDouble(),
                gender: isMale ? "male" : "female",
              );
            },
            child: state is BmiLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text("Calculate BMI"),
          ),
        );
      },
    );
  }
}
