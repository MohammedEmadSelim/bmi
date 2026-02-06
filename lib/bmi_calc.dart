import 'package:flutter/material.dart';
import 'package:bmi/models/bmi_view_model.dart';
import 'package:bmi/final_screen.dart';
class BmiCalc extends StatefulWidget {
  const BmiCalc({super.key});

  @override
  State<BmiCalc> createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {
  bool isMale = true;
  int height = 170;
  int weight = 70;
  final name = TextEditingController();
  final birthDate = TextEditingController();

  String selectGender = "Male";

  final viewModel = BmiViewModel();




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F7FC),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'BMI',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1B5E20),
                    ),
                  ),
                ),


                const SizedBox(height: 30),

                const Text(
                  'Name',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFEFF5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: name,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Birth Date',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFEFF5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  TextField(
                    controller: birthDate,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Choose Gender',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = true;
                            selectGender = "Male";
                          });
                        },
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: isMale ? const Color(0xFFD1D9E6) : const Color(0xFFEFEFF5),
                            borderRadius: BorderRadius.circular(15),
                            // ignore: deprecated_member_use
                            border: isMale ? Border.all(color: Colors.blue.withOpacity(0.5)) : null,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [

                              Text('Male', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            isMale = false;
                            selectGender = "Female";
                          });
                        },
                        child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            color: !isMale ? const Color(0xFFD1D9E6) : const Color(0xFFEFEFF5),
                            borderRadius: BorderRadius.circular(15),
                            // ignore: deprecated_member_use
                            border: !isMale ? Border.all(color: Colors.blue.withOpacity(0.5)) : null,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [

                              Text('Female', style: TextStyle(fontSize: 16)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Your Height(cm)',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFEFF5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            height--;

                          });
                        },
                        icon: const Icon(Icons.remove, color: Color(0xFF48466D)),
                      ),
                      Text(
                        '$height',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            height++;
                          });
                        },
                        icon: const Icon(Icons.add, color: Color(0xFF48466D)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Your Weight(kg)',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: const Color(0xFFEFEFF5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            weight--;
                          });
                        },
                        icon: const Icon(Icons.remove, color: Color(0xFF48466D)),
                      ),
                      Text(
                        '$weight',
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                        icon: const Icon(Icons.add, color: Color(0xFF48466D)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF48466D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () async {
                      double weightModel = weight.toDouble();
                      double h = height.toDouble();
                      String gender = isMale ? "male" : "female";

                      await viewModel.calculateBMI(
                        weight: weightModel,
                        height: h,
                        gender: gender,
                      );

                      if (context.mounted) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FinalScreen(
                              name: name.text,
                              bmiValue: viewModel.bmiResult ?? "0.0",
                              status: viewModel.healthStatus ?? "",
                              height: height,
                              weight: weight,
                              gender: gender,
                            ),
                          ),
                        );
                      }
                    },
                    child: const Text(
                      'Calculate BMI',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}