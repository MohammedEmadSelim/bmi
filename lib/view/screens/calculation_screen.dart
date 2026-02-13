import 'package:bmi/core/theme/colors.dart';
import 'package:bmi/models/bmi_model.dart';
import 'package:bmi/view/screens/result_screen.dart';
import 'package:bmi/view/widgets/custom_text_field.dart';
import 'package:bmi/view/widgets/gender_card.dart';
import 'package:bmi/view/widgets/increamental_text_field.dart';
import 'package:bmi/view_model/repository.dart';
import 'package:flutter/material.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({super.key});

  @override
  State<CalculationScreen> createState() => _CalculationScreenState();
}

class _CalculationScreenState extends State<CalculationScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  var flag = 0;
  MainAppRepo repo = MainAppRepo();

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
            onTap: () async {
              var date = await showDatePicker(
                context: context,
                firstDate: DateTime(1920),
                lastDate: DateTime.now(),
              );

              if (date != null) {
                birthController.text = date.toString();
              }
            },
            title: "Birth Date",
            controller: birthController,
          ),
          SizedBox(height: 16),

          /// select gender
          Row(
            children: [
              Text(
                "Choose Gender",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    flag = 0;
                  });
                },
                child: GenderCard(
                  title: 'male',
                  image: 'assets/images/male.png',
                  selected: flag == 0 ? true : false,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    flag = 1;
                  });
                },
                child: GenderCard(
                  title: 'female',
                  image: 'assets/images/female (1).svg',
                  selected: flag == 1 ? true : false,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          IncrementalTextFormField(
            controller: heightController,
            onDecrementTap: () {
              if (heightController.text.isNotEmpty) {
                var value = int.parse(heightController.text);
                if (value > 0) {
                  value--;
                }
                heightController.text = value.toString();
              }
            },
            onIncrementTap: () {
              if (heightController.text.isNotEmpty) {
                var value = int.parse(heightController.text);

                value++;

                heightController.text = value.toString();
              }
            },
            title: "Your Height(cm)",
          ),
          IncrementalTextFormField(
            controller: weightController,
            onDecrementTap: () {
              if (weightController.text.isNotEmpty) {
                var value = int.parse(weightController.text);
                if (value > 0) {
                  value--;
                }
                weightController.text = value.toString();
              }
            },
            onIncrementTap: () {
              if (weightController.text.isNotEmpty) {
                var value = int.parse(weightController.text);

                value++;
                weightController.text = value.toString();
              }
            },

            title: "Your Weight(Km)",
          ),

          SizedBox(height: 24),
          SizedBox(
            width: 300,
            height: 45,
            child: ElevatedButton(
              onPressed: () async {
                /// navigate to mew screen

                Map<String, dynamic> res = await repo.calcBmi(
                  weightController.text,
                  heightController.text,
                );
                var data = BmiModel.fromJson(res);
                print(data);
                /// iam ready to navigate will all data
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => ResultScreen(bmiModel: data, name: nameController.text, birth: birthController.text),));
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
                "Calculate BMI",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}