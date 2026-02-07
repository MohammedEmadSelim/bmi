import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiInputScreen(),
    );
  }
}

class BmiInputScreen extends StatefulWidget {
  const BmiInputScreen({super.key});

  @override
  State<BmiInputScreen> createState() => _BmiInputScreenState();
}

class _BmiInputScreenState extends State<BmiInputScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  int height = 170;
  int weight = 70;
  String gender = 'male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [


              const Center(
                child: Text(
                  'BMI',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0B4F2E),
                  ),
                ),
              ),

              const SizedBox(height: 30),


              const Text('Name'),
              const SizedBox(height: 8),
              TextField(
                controller: nameController,
                decoration: inputDecoration(),
              ),

              const SizedBox(height: 20),


              const Text('Birth Date'),
              const SizedBox(height: 8),
              TextField(
                controller: dateController,
                readOnly: true,
                decoration: inputDecoration(
                  icon: Icons.calendar_today,
                ),
                onTap: () async {
                  DateTime? picked = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1950),
                    lastDate: DateTime.now(),
                    initialDate: DateTime(2000),
                  );
                  if (picked != null) {
                    dateController.text =
                    '${picked.day}/${picked.month}/${picked.year}';
                  }
                },
              ),

              const SizedBox(height: 25),

              const Text('Choose Gender'),
              const SizedBox(height: 12),
              Row(
                children: [
                  genderCard('Male', Icons.male, 'male'),
                  const SizedBox(width: 12),
                  genderCard('Female', Icons.female, 'female'),
                ],
              ),

              const SizedBox(height: 25),

              valueSelector(
                title: 'Your Height (cm)',
                value: height,
                onMinus: () {
                  setState(() => height--);
                },
                onPlus: () {
                  setState(() => height++);
                },
              ),

              const SizedBox(height: 20),

              valueSelector(
                title: 'Your Weight (kg)',
                value: weight,
                onMinus: () {
                  setState(() => weight--);
                },
                onPlus: () {
                  setState(() => weight++);
                },
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4B4C8A),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {

                  },
                  child: const Text(
                    'Calculate BMI',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration inputDecoration({IconData? icon}) {
    return InputDecoration(
      filled: true,
      fillColor: const Color(0xFFEDEFFF),
      suffixIcon: icon != null ? Icon(icon) : null,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
    );
  }


  Widget genderCard(String title, IconData icon, String value) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => gender = value);
        },
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: gender == value
                ? const Color(0xFFDDE0FF)
                : const Color(0xFFEDEFFF),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Icon(icon, size: 50),
              const SizedBox(height: 8),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }

  Widget valueSelector({
    required String title,
    required int value,
    required VoidCallback onMinus,
    required VoidCallback onPlus,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFFEDEFFF),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: onMinus,
              ),
              Expanded(
                child: Center(
                  child: Text(
                    value.toString(),
                    style: const TextStyle(fontSize: 18),
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: onPlus,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
