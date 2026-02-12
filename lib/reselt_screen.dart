import 'package:flutter/material.dart';

class InputScreen extends StatelessWidget {
  final String name;
  final int height;
  final int weight;
  final String gender;

  const InputScreen({
    super.key,
    required this.name,
    required this.height,
    required this.weight,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    double bmi = weight / ((height / 100) * (height / 100));

    String status = "Normal";
    String statusDetail = "Your BMI is normal";
    if (bmi < 18.5) {
      status = "Underweight";
      statusDetail = "Your BMI is less than 18.5";
    } else if (bmi >= 25) {
      status = "Overweight";
      statusDetail = "Your BMI is more than 25";
    }

    String description = "Lorem ipsum dolor sit amet consectetur. "
        "Sagittis interdum dui enim imperdiet sapien cursus velit pharetra. "
        "Viverra justo tempor dictum odio. Nisl non dui integer orci nulla eget "
        "laoreet tellus. Orci nunc a orci convallis ac orci. "
        "Urna auctor at elementum sit ante maecenas ullamcorper rhoncus dictum. "
        "Morbi venenatis lectus ultrices euismod. Laoreet purus risus amet enim "
        "sagittis ut. Consectetur libero orci urnager dignissis est.";

    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FF),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: const Icon(Icons.more_vert, color: Colors.black), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(25),
              decoration: BoxDecoration(
                color: const Color(0xFF8387D3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                        const Text("A 20 years old", style: TextStyle(color: Colors.white70, fontSize: 14)),
                        const SizedBox(height: 15),
                        Text(bmi.toStringAsFixed(1), style: const TextStyle(color: Colors.white, fontSize: 45, fontWeight: FontWeight.bold)),
                        const Text("BMI Calc", style: TextStyle(color: Colors.white70, fontSize: 16)),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            _infoItem(height.toString(), "cm", "Height"),
                            const SizedBox(width: 20),
                            _infoItem(weight.toString(), "kg", "Weight"),
                          ],
                        )
                      ],
                    ),
                  ),
                  Image.asset(
                    "assets/img_1.png",
                    height: 150,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(
                  color: const Color(0xFF0D4D33),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(status, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 5),
                      Text(statusDetail, style: const TextStyle(color: Colors.white70, fontSize: 16)),
                      const SizedBox(height: 20),
                      Text(
                        description,
                        style: const TextStyle(color: Colors.white70, fontSize: 14, height: 1.6),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 25),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF4C51BF),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text("Calculate BMI Again", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _infoItem(String value, String unit, String label) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(width: 4),
            Text(unit, style: const TextStyle(color: Colors.white70, fontSize: 11)),
          ],
        ),
        Text(label, style: const TextStyle(color: Colors.white70, fontSize: 12)),
      ],
    );
  }
}