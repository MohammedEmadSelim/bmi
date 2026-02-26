import 'package:bmi/core/app_color.dart';
import 'package:bmi/models/bmi_model.dart';
import 'package:bmi/view/screens/bmi_result.dart';
import 'package:bmi/view/widgets/containe_textbutton.dart';
import 'package:bmi/view/widgets/custom_text_field.dart';
import 'package:bmi/view/widgets/gendar_type.dart';
import 'package:bmi/view/widgets/inc_textfield_dec.dart';
import 'package:flutter/material.dart';


class BmiForm extends StatefulWidget {
  const BmiForm({super.key});

  @override
  State<BmiForm> createState() => _BmiFormState();
}

class _BmiFormState extends State<BmiForm> {
  final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  int selectedImage = -1;
  double height = 0;
  double weight = 0;
  TextEditingController heightController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController birthdateController = TextEditingController();

  Future<void> selectData() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        birthdateController.text =
        "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  void incHeight() {
    setState(() {
      height = (double.tryParse(heightController.text) ?? 0) + 1;
      heightController.text = height.toString();
    });
  }

  void decHeight() {
    setState(() {
      height = (double.tryParse(heightController.text) ?? 0) - 1;
      if (height < 0) height = 0;
      heightController.text = height.toString();
    });
  }

  void incWeight() {
    setState(() {
      weight = (double.tryParse(weightController.text) ?? 0) + 1;
      weightController.text = weight.toString();
    });
  }

  void decWeight() {
    setState(() {
      weight = (double.tryParse(weightController.text) ?? 0) - 1;
      if (weight < 0) weight = 0;
      weightController.text = weight.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Center(
        child: Form(
          key: globalKey,
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
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty)  {return "Required name";}
                  return null;
                },
                title: 'Name',
                hintText: 'Enter Your Name',
                controller: nameController,
              ),
              CustomTextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {return "Required BirthDate";}
                  return null;
                },
                title: 'Birth Date',
                hintText: 'Select Your Birth Date',
                controller: birthdateController,
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedImage = selectedImage == 0 ? -1 : 0;
                      });
                    },
                    child: GenderType(
                      title: 'Male',
                      image: 'assets/images/male.png',
                      isSelected: selectedImage == 0,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedImage = selectedImage == 1 ? -1 : 1;
                      });
                    },
                    child: GenderType(
                      title: 'Female',
                      image: 'assets/images/female.png',
                      isSelected: selectedImage == 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 21),
              IncTextFieldDec(
                validator: (value) {
                  if (value == null || value.isEmpty)
                  {return "Please Enter Your Height";}
                  if (double.tryParse(value) == null)
                  {return "Enter a valid number";}
                  return null;
                },
                title: 'Your Height (cm)',
                readonly: false,
                hintText: 'Enter Your height',
                controller: heightController,
                onIncrement: incHeight,
                onDecrement: decHeight,
              ),
              IncTextFieldDec(
                validator: (value) {
                  if (value == null || value.isEmpty)
                  {return "Please Enter Your Weight";}
                  if (double.tryParse(value) == null)
                  {return "Enter a valid number";}
                  return null;
                },
                title: 'Your Weight (kg)',
                readonly: false,
                hintText: 'Enter Your weight',
                controller: weightController,
                onIncrement: incWeight,
                onDecrement: decWeight,
              ),
              SizedBox(height: 20),
              ContaineTextbutton(
                text: "Calculate BMI",
                onPressed: (){
                  if (globalKey.currentState!.validate()) {
                    // calculate BMI or navigate
                    //print(globalKey.currentState!.validate());
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context)=>BmiResult(
                          height: double.parse(heightController.text),
                          weight: double.parse(weightController.text),
                          name: nameController.text,
                          birthdate: birthdateController.text,
                        ))
                    );
                  }
                },)
            ],
          ),
        ),
      ),
    );
  }
}