import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/input_fields.dart';
import 'result_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen> createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  final nameController = TextEditingController();
  final birthController = TextEditingController();
  String gender = 'Male';
  int height = 180;
  int weight = 70;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            children: [
              const Text('BMI', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Color(0xFF1E4D3B))),
              const SizedBox(height: 30),
              _buildField("Name", nameController),
              const SizedBox(height: 20),
              _buildField("Birth Date", birthController),
              const SizedBox(height: 30),
              GenderSelector(selectedGender: gender, onSelect: (val) => setState(() => gender = val)),
              const SizedBox(height: 30),
              _buildAdjuster("Your Height(cm)", height, (v) => setState(() => height = v)),
              const SizedBox(height: 20),
              _buildAdjuster("Your Weight(kg)", weight, (v) => setState(() => weight = v)),
              const SizedBox(height: 50),
              CustomButton(
                text: "Calculate BMI",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ResultScreen(
                        userName: nameController.text,
                        userAge: birthController.text,
                        gender: gender,
                        weight: weight,
                        height: height,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey)),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color(0xFFF0F2FF),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide.none),
          ),
        ),
      ],
    );
  }

  Widget _buildAdjuster(String label, int val, Function(int) onChange) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(color: const Color(0xFFF0F2FF), borderRadius: BorderRadius.circular(15)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Row(
            children: [
              IconButton(onPressed: () => onChange(val - 1), icon: const Icon(Icons.remove)),
              Text('$val', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(onPressed: () => onChange(val + 1), icon: const Icon(Icons.add)),
            ],
          ),
        ],
      ),
    );
  }
}