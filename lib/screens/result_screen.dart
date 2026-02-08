import 'package:flutter/material.dart';
import '../widgets/custom_button.dart';
import '../widgets/info_card.dart';
import '../api/api_handler.dart';

class ResultScreen extends StatefulWidget {
  final String userName;
  final String userAge;
  final String gender;
  final int weight;
  final int height;

  const ResultScreen({
    super.key,
    required this.userName,
    required this.userAge,
    required this.gender,
    required this.weight,
    required this.height,
  });

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  final ApiHandler _apiHandler = ApiHandler();
  double? bmiResult;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadBmi();
  }

  void _loadBmi() async {
    final result = await _apiHandler.fetchBmiFromApi(
      weight: widget.weight,
      height: widget.height,
    );
    setState(() {
      bmiResult = result;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(25),
                decoration: BoxDecoration(color: const Color(0xFF818CF8), borderRadius: BorderRadius.circular(25)),
                child: Column(
                  children: [
                    Text(widget.userName, style: const TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
                    Text("A ${widget.userAge} years old ${widget.gender.toLowerCase()}.", style: const TextStyle(color: Colors.white70)),
                    const SizedBox(height: 20),
                    isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : Text(
                      bmiResult?.toStringAsFixed(1) ?? "--",
                      style: const TextStyle(color: Colors.white, fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    const Text("BMI Calc", style: TextStyle(color: Colors.white70)),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InfoCard(label: "Height", value: "${widget.height}", unit: "cm"),
                        InfoCard(label: "Weight", value: "${widget.weight}", unit: "kg"),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              if (!isLoading) _buildStatusCard(),
              const Spacer(),
              CustomButton(text: "Calculate BMI Again", onPressed: () => Navigator.pop(context)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusCard() {
    String status = bmiResult! < 18.5 ? "Under Weight" : "Normal Weight";
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(color: const Color(0xFF064E3B), borderRadius: BorderRadius.circular(20)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(status, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
          const Text("Based on your real-time data", style: TextStyle(color: Colors.white70)),
          const SizedBox(height: 10),
          const Text("Maintain a balanced diet and regular exercise to stay healthy.", style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}