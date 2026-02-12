import 'package:bmi/core/theme/colors.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  const GenderCard({
    super.key,
    required this.image,
    required this.title,
    required this.selected,
  });

  final String image;
  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: BoxBorder.fromBorderSide(
          selected
              ? BorderSide(color: const Color.fromARGB(255, 124, 135, 212))
              : BorderSide.none,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 10, right: 10, left: 10),
            decoration: BoxDecoration(
              color: ColorsUsed.lightcolor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(image),
          ),
          SizedBox(height: 4),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ],
      ),
    );
  }
}
