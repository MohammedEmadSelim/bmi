import 'package:flutter/material.dart';

class SecondCard extends StatelessWidget {
  final String status;

  const SecondCard({
    super.key,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final data = _getStatusData(status);

    return Container(
      decoration: BoxDecoration(
        color: data.color,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              data.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              data.subtitle,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              data.description,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  _StatusData _getStatusData(String status) {
    switch (status.toLowerCase()) {
      case "underweight":
        return _StatusData(
          title: "Under Weight",
          subtitle: "Your BMI is less than 18.5",
          description:
          "You may need to gain some weight. Consider consulting a healthcare provider for guidance.",
          color: Colors.blue,
        );

      case "normal":
        return _StatusData(
          title: "Normal Weight",
          subtitle: "Your BMI is between 18.5 and 24.9",
          description:
          "Great job! Keep maintaining your healthy lifestyle.",
          color: Colors.green,
        );

      case "overweight":
        return _StatusData(
          title: "Over Weight",
          subtitle: "Your BMI is between 25 and 29.9",
          description:
          "You may need to adjust your diet and increase physical activity.",
          color: Colors.orange,
        );

      case "obese":
        return _StatusData(
          title: "Obese",
          subtitle: "Your BMI is above 30",
          description:
          "It is recommended to consult a healthcare professional for advice.",
          color: Colors.red,
        );

      default:
        return _StatusData(
          title: status,
          subtitle: "",
          description: "",
          color: Colors.grey,
        );
    }
  }
}

class _StatusData {
  final String title;
  final String subtitle;
  final String description;
  final Color color;

  _StatusData({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.color,
  });
}
