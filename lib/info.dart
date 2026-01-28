import 'package:bmi/theme/color.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Navigator.pop(context);

        }, icon: Icon(Icons.arrow_back)),
      ),
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color:AppColors.primary,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Samy Call",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 22,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "A 23 years old male.",
                            style: TextStyle(color: Colors.white70),
                          ),
                          SizedBox(height: 25),

                          Text(
                            "16.5",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "BMI Calc",
                            style: TextStyle(color: Colors.white70),
                          ),
                          SizedBox(height: 25),

                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("180 cm",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Text("Height",
                                      style:
                                      TextStyle(color: Colors.white70)),
                                ],
                              ),
                              SizedBox(width: 20),
                              SizedBox(
                                height: 40,
                                child: VerticalDivider(
                                  color: Colors.white54,
                                  thickness: 1,
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("70 kg",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold)),
                                  Text("Weight",
                                      style:
                                      TextStyle(color: Colors.white70)),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Image.asset(
                      "assets/images/img_1.png",
                      height: 180,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: AppColors.green,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      "Under Weight",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 8),
                    Text(
                      "Your BMI is less than 18.5",
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 15),
                    Text(
                      "Lorem ipsum dolor sit amet consectetur. Sagittis interdum dui enim imperdiet sapien cursus velit pharetra. Viverra justo tempor dictum odio.",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.darkPurple,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text(
                    "Calculate BMI Again",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
