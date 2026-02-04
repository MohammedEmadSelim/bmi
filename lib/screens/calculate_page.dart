import 'package:bmi/core/colors.dart';
import 'package:bmi/formField/custom_text_field.dart';
import 'package:bmi/formField/increment_text_field.dart';
import 'package:bmi/models/bmi_model.dart';
import 'package:bmi/models/repo_model.dart';
import 'package:bmi/screens/result_page.dart';
import 'package:flutter/material.dart';
import '../gander_card/gander_selected.dart';

class CalculatePage extends StatefulWidget {
  const CalculatePage({super.key});

  @override
  State<CalculatePage> createState() => _CalculatePageState();
}

class _CalculatePageState extends State<CalculatePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  var flag = 0;
  AppRepo repo = AppRepo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "B M I",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: AppColors.green,
              ),
            ),
            SizedBox(height: 10),
            CustomTextField(title: "Name", controller: nameController),
            SizedBox(height: 16),
            CustomTextField(
              readOnly: true,
              onTap: () async {
                var date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1950),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  birthController.text = date.toString();
                }
              },
              title: "Birth Date",
              controller: birthController,
            ),
            SizedBox(height: 50),

            /// selected gander
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      flag = 0;
                    });
                  },
                  child: GanderSelected(
                    title: "Male",
                    image: "assets/images/Group.png",
                    selected: flag == 1 ? true : false,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      flag = 0;
                    });
                  },
                  child: GanderSelected(
                    title: "Female",
                    image: "assets/images/female.png",
                    selected: flag == 1 ? true : false,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            /// Height & Weight
            IncrementTextField(
              controller: heightController,
              onDecrement: () {
                if (heightController.text.isNotEmpty) {
                  var value = int.parse(heightController.text);
                  if (value > 0) {
                    value--;
                  }
                  heightController.text = value.toString();
                }
              },
              onIncrement: () {
                if (heightController.text.isNotEmpty) {
                  var value = int.parse(heightController.text);
                  if (value < 0) {
                    value++;
                  }
                  heightController.text = value.toString();
                }
              },
              title: "Your Height(cm)",
            ),
            SizedBox(height: 15),
            IncrementTextField(
              controller: weightController,
              onDecrement: () {
                if (weightController.text.isNotEmpty) {
                  var value = int.parse(weightController.text);
                  if (value > 0) {
                    value--;
                  }
                  weightController.text = value.toString();
                }
              },
              onIncrement: () {
                if (weightController.text.isNotEmpty) {
                  var value = int.parse(weightController.text);
                  if (value < 0) {
                    value++;
                  }
                  weightController.text = value.toString();
                }
              },
              title: "Your Weight(cm)",
            ),
            SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              height: 45,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 29.0),
                child: ElevatedButton(
                  onPressed: () async {
                    Map<String, dynamic> result = await repo.calcBmi(
                      weightController.text,
                      heightController.text,
                    );

                    var model = BmiModel.fromJson(result);
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                          bmiModel: model,
                          name: nameController.text,
                          birth: birthController.text,
                        ),
                      ),
                    );

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.deepPurpel,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(5),
                    ),
                  ),
                  child: Text(
                    "Calculate BMI",
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
    );
  }
}
