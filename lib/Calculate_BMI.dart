import 'package:flutter/material.dart';
import 'ResultPage.dart';
import 'core/theme/colors.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;

  final TextEditingController heightController =
  TextEditingController(text: '170');
  final TextEditingController weightController =
  TextEditingController(text: '70');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    'B M I',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: AppColors.lightgreen,
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                _label('Name'),
                _normalTextField(),

                const SizedBox(height: 20),

                _label('Birth Date'),
                _normalTextField(),

                const SizedBox(height: 20),

                _label('Choose Gender'),
                const SizedBox(height: 15),

                Row(
                  children: [
                    _genderCard(
                      title: 'Male',
                      imagePath: 'assets/images/male.png',
                      isSelected: isMale,
                      onTap: () => setState(() => isMale = true),
                    ),
                    const SizedBox(width: 40),
                    _genderCard(
                      title: 'Female',
                      imagePath: 'assets/images/female.png',
                      isSelected: !isMale,
                      onTap: () => setState(() => isMale = false),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                numberStepperField(
                  title: 'Your Height (cm)',
                  controller: heightController,
                ),

                const SizedBox(height: 20),

                numberStepperField(
                  title: 'Your Weight (kg)',
                  controller: weightController,
                ),

                const SizedBox(height: 50),

                SizedBox(
                  width: double.infinity,
                  height: 45,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BmiResultPage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.darkPurple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      'Calculate BMI',
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ================= Widgets =================

  Widget _label(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 16,
        color: AppColors.graylabel,
      ),
    );
  }

  Widget _normalTextField() {
    return TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF1F3FA),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget numberStepperField({
    required String title,
    required TextEditingController controller,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _label(title),
        const SizedBox(height: 10),
        Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: AppColors.lightPurple,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  int value = int.tryParse(controller.text) ?? 0;
                  if (value > 0) value--;
                  controller.text = value.toString();
                  setState(() {});
                },
                child: const Icon(Icons.remove,
                    size: 40,color: AppColors.darkPurple,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    isDense: true,
                  ),
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  int value = int.tryParse(controller.text) ?? 0;
                  value++;
                  controller.text = value.toString();
                  setState(() {});
                },
                child: const Icon(Icons.add,
                  size: 40,color: AppColors.darkPurple,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _genderCard({
    required String title,
    required String imagePath,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              height: 130,
              width: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: isSelected
                      ?  Color(0xff484783)
                      : Colors.transparent,
                  width: 2,
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.graylabel,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
