import 'package:bmi/core/app_const.dart';
import 'package:bmi/shared/custom_text_button.dart';
import 'package:bmi/shared/custom_text_field.dart';
import 'package:bmi/features/bmi_result_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController birthDateController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  DateTime? birthDate;

  String? selectedGender;
  void increment(TextEditingController controller) {
    double value = double.tryParse(controller.text) ?? 0;
    value++;
    controller.text = value.toString();
  }

  void decrement(TextEditingController controller) {
    double value = double.tryParse(controller.text) ?? 0;
    if (value > 0) value--;
    controller.text = value.toString();
  }

  Future<void> pickDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      setState(() {
        birthDate = pickedDate;
      });

      birthDateController.text =
          '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 75),
            Image.asset('assets/images/BMI.png'),
            SizedBox(height: 35),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'Name',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  textInputType: TextInputType.name,
                  controller: nameController,
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'Birth Date',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 10),
                CustomTextField(
                  textInputType: TextInputType.datetime,
                  readOnly: true,
                  controller: birthDateController,
                  onTap: () {
                    pickDate(context);
                  },
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'Choose Gender',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = 'male';
                        });
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: selectedGender == 'male'
                              ? AppColors.burble
                              : AppColors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset('assets/images/male.png'),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGender = 'female';
                        });
                      },
                      child: Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          color: selectedGender == 'female'
                              ? AppColors.burble
                              : AppColors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset('assets/images/female.png'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
                    Text(
                      'Male',
                      style: TextStyle(color: Colors.black87, fontSize: 16),
                    ),
                    Text(
                      'Female',
                      style: TextStyle(color: Colors.black87, fontSize: 16),
                    ),
                  ],
                ),
                SizedBox(height: 53),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'Your Height(cm)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextField(
                    controller: heightController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.primary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: IconButton(
                        onPressed: () => decrement(heightController),
                        icon: Icon(Icons.remove),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => increment(heightController),
                        icon: Icon(Icons.add),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'Your Weight(kg)',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: TextField(
                    controller: weightController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: AppColors.primary,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      prefixIcon: IconButton(
                        onPressed: () => decrement(weightController),
                        icon: Icon(Icons.remove),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () => increment(weightController),
                        icon: Icon(Icons.add),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40),
                CustomTextButton(
                  text: 'Calculate BMI',
                  onPressed: () {
                    if (birthDate == null ||
                        nameController.text.isEmpty ||
                        selectedGender == null ||
                        heightController.text.isEmpty ||
                        weightController.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please Complete The Form'),
                        ),
                      );
                      return;
                    }
                    final String name = nameController.text;
                    final double height =
                        double.tryParse(heightController.text) ?? 0;
                    final double weight =
                        double.tryParse(weightController.text) ?? 0;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BmiResultScreen(
                          height: height,
                          weight: weight,
                          name: name,
                          birthDate: birthDate!,
                          gender: selectedGender!,
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
