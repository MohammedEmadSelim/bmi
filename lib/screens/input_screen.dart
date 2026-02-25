import 'package:flutter/material.dart';
import '../widgets/text_input.dart';
import '../widgets/number_input.dart';
import '../widgets/gender_selector.dart';
import '../data/bmi_model.dart';
import '../services/bmi_service.dart';
import 'app_colors.dart';
import 'result_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthController = TextEditingController();
  final TextEditingController heightController = TextEditingController(text: "180");
  final TextEditingController weightController = TextEditingController(text: "75");

  var flag = 0;
  BmiService service = BmiService();

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
          TextInput(title: "Name", controller: nameController),
          SizedBox(height: 16),
          TextInput(
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
                child: GenderSelector(
                  title: 'male',
                  image: "assets/images/male.png",
                  selected: flag == 0 ? true : false,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    flag = 1;
                  });
                },
                child: GenderSelector(
                  title: 'female',
                  image: "assets/images/female.png",
                  selected: flag == 1 ? true : false,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          NumberInput(
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
          NumberInput(
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
                Map<String, dynamic> res = await service.calculateBmi(
                  weightController.text,
                  heightController.text,
                );
                var data = BmiModel.fromJson(res);
                print(data);

                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ResultScreen(
                    bmiModel: data,
                    name: nameController.text,
                    birth: birthController.text,
                  ),
                ));
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
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
