import 'package:bmi/core/app_color.dart';
import 'package:bmi/models/bmi_model.dart';
import 'package:bmi/view/widgets/custom_text_field.dart';
import 'package:bmi/view/widgets/gendar_type.dart';
import 'package:bmi/view/widgets/inc_textfield_dec.dart';
import 'package:bmi/view_model/bmi_service.dart';
import 'package:flutter/material.dart';
import 'bmi_result.dart';

class BmiForm extends StatefulWidget {
  const BmiForm({super.key});

  @override
  State<BmiForm> createState() => _BmiFormState();
}

class _BmiFormState extends State<BmiForm> {

  int selectedImage = -1;
  double height = 0;
  double weight = 0;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController birthdate = TextEditingController();

  Future<void> selectData() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        birthdate.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  void incHeight() {
     height++;
     heightController.text=height.toString();
  }

  void decHeight() {
    if (height > 0) {
      height--;
    }
    heightController.text=height.toString();
  }

  void incWeight() {
    weight++;
    weightController.text=weight.toString();
  }

  void decWeight() {
    if (weight > 0) {
      weight--;
    }
    weightController.text=weight.toString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Center(
        child: Column(
          children: [
            Text(
              'BMI',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                letterSpacing: 20,
                color: Colors.green[900],
              ),
            ),
            SizedBox(height: 35),
            CustomTextFormField(
              title: 'Name',
              hintText: 'Enter Your Name',
              controller: name,
            ),
            CustomTextFormField(
              title: 'Birth Date',
              hintText: 'Select Your Birth Date ',
              controller: birthdate,
              readonly: true,
              onTap: selectData,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                children: [
                  Text(
                    'Choose Gender',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColor.gray2,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(onTap: (){
                  setState(() {
                    selectedImage = selectedImage == 0?-1:0;
                  });
                }
                ,child: GenderType(title: 'Male', image: 'assets/images/male.png',isSelected: selectedImage==0,)),
                GestureDetector(onTap:(){
                  setState(() {
                    selectedImage = selectedImage == 1?-1:1;
                  });
                },
                    child: GenderType(title: 'Female', image: 'assets/images/female.png',isSelected:selectedImage==1)),
              ],
            ),
            SizedBox(height:21),
            IncTextFieldDec(
              title: 'Your Height (cm)',
              readonly: false,
              hintText: 'Enter Your height',
              controller: heightController,
              onIncrement: incHeight,
              onDecrement: decHeight,
            ),
            IncTextFieldDec(
              title: 'Your Weight (kg)',
              readonly: false,
              hintText: 'Enter Your weight',
              controller: weightController,
              onIncrement: incWeight,
              onDecrement: decWeight,
            ),
            SizedBox(height: 20),
            Container(
              width: 332,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.purple1,
              ),
              child: TextButton(
                onPressed: () async {
                  if (name.text.trim().isNotEmpty &&
                      birthdate.text.isNotEmpty &&
                      heightController.text.isNotEmpty &&
                      weightController.text.isNotEmpty) {
                    final bmiResult = await BmiService().getBmiData(height,weight);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BmiResult(bmi: bmiResult)),
                    );
                    print('submit');
                  } else {
                    print('please enter your data');
                  }
                },
                child: Text(
                  'Calculate BMI',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5,
                    color: Colors.white,
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
