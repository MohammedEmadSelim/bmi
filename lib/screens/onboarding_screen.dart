import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import 'input_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(child: Image.asset('assets/onboarding_bg.png', fit: BoxFit.contain)),
          Container(
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              color: Color(0xFF818CF8),
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Know Your Body Better ,\nGet Your BMI Score in Less Than a Minute!",
                    style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
                const SizedBox(height: 15),
                const Text("It takes just 30 seconds – and your health is worth it!",
                    style: TextStyle(color: Colors.white70, fontSize: 16)),
                const SizedBox(height: 30),
                CustomButton(
                  text: "Get Start",
                  onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const InputScreen())),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}