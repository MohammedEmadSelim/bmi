import 'package:bmi/core/theme/colors.dart';
import 'package:bmi/view/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({super.key});

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "BMI",
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w700,
              color: AppColors.green,
            ),
          ),
          CustomTextFormField(title: "Name", controller: nameController),
          SizedBox(height: 16),
          CustomTextFormField(
            readOnly: true,
            onTap: () {
              birthController.text = "2002/2/14";
            },
            title: "Birth Date",
            controller: birthController,
          ),
        ],
      ),
    );
  }
}
