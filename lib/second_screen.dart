import 'package:flutter/material.dart';
import 'reselt_screen.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int height = 170;
  int weight = 70;
  bool isMale = true;
  String birthDate = "Select Date";
  final TextEditingController nameController = TextEditingController();

  Set<String> selectedDiseases = {};
  final List<String> healthConditions = [
    "Diabetes",
    "Hypertension",
    "Heart Disease",
    "Asthma"
  ];

  Future<void> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        birthDate = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Body Details', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _field("Full Name", nameController, Icons.person_outline),
            _dateField("Birth Date", Icons.calendar_today_outlined),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _genderCard("Male", "assets/male.png", isMale),
                _genderCard("Female", "assets/female.png", !isMale),
              ],
            ),
            const SizedBox(height: 30),
            _counterCard("Height", height, "cm", (v) => setState(() => height = v)),
            const SizedBox(height: 15),
            _counterCard("Weight", weight, "kg", (v) => setState(() => weight = v)),
            const SizedBox(height: 30),
            const Text("Health Status", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const Text("Select any conditions you have", style: TextStyle(fontSize: 13, color: Colors.grey)),
            const SizedBox(height: 15),
            Wrap(
              spacing: 10,
              children: healthConditions.map((condition) {
                bool isSelected = selectedDiseases.contains(condition);
                return FilterChip(
                  label: Text(condition),
                  selected: isSelected,
                  onSelected: (bool selected) {
                    setState(() {
                      selected ? selectedDiseases.add(condition) : selectedDiseases.remove(condition);
                    });
                  },
                  selectedColor: const Color(0xFF4C51BF),
                  checkmarkColor: Colors.white,
                  labelStyle: TextStyle(color: isSelected ? Colors.white : Colors.black),
                );
              }).toList(),
            ),
            const SizedBox(height: 40),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4C51BF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => InputScreen(
                        name: nameController.text.isEmpty ? "User" : nameController.text,
                        height: height,
                        weight: weight,
                        gender: isMale ? "Male" : "Female",
                      ),
                    ),
                  );
                },
                child: const Text('Calculate BMI', style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _field(String label, TextEditingController controller, IconData icon) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      Container(
        margin: const EdgeInsets.only(top: 8, bottom: 20),
        decoration: BoxDecoration(color: const Color(0xFFF0F2F8), borderRadius: BorderRadius.circular(12)),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(prefixIcon: Icon(icon, color: const Color(0xFF4C51BF)), border: InputBorder.none, contentPadding: const EdgeInsets.symmetric(vertical: 15)),
        ),
      ),
    ],
  );

  Widget _dateField(String label, IconData icon) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
      GestureDetector(
        onTap: _pickDate,
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.only(top: 8),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(color: const Color(0xFFF0F2F8), borderRadius: BorderRadius.circular(12)),
          child: Row(children: [Icon(icon, color: const Color(0xFF4C51BF)), const SizedBox(width: 10), Text(birthDate)]),
        ),
      ),
    ],
  );

  Widget _genderCard(String label, String image, bool isSelected) => GestureDetector(
    onTap: () => setState(() => isMale = (label == "Male")),
    child: Container(
      width: MediaQuery.of(context).size.width * 0.4,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF4C51BF).withOpacity(0.1) : Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: isSelected ? const Color(0xFF4C51BF) : Colors.grey.shade300, width: 2),
      ),
      child: Column(children: [Image.asset(image, width: 50), const SizedBox(height: 10), Text(label, style: TextStyle(fontWeight: FontWeight.bold, color: isSelected ? const Color(0xFF4C51BF) : Colors.black))]),
    ),
  );

  Widget _counterCard(String label, int value, String unit, Function(int) onUpdate) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    decoration: BoxDecoration(color: const Color(0xFFF0F2F8), borderRadius: BorderRadius.circular(12)),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        Row(children: [
          IconButton(onPressed: () => onUpdate(value - 1), icon: const Icon(Icons.remove_circle_outline, color: Color(0xFF4C51BF))),
          Text('$value $unit', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          IconButton(onPressed: () => onUpdate(value + 1), icon: const Icon(Icons.add_circle_outline, color: Color(0xFF4C51BF))),
        ]),
      ],
    ),
  );
}