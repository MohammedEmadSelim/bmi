import 'package:flutter/material.dart';
class GenderCard extends StatelessWidget {
  final String label, img;
  final bool isSelected;
  final VoidCallback onTap;
  GenderCard({required this.label, required this.img, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Color(0xFFF0F0FF),
          borderRadius: BorderRadius.circular(15),
          border: isSelected ? Border.all(color: Color(0xFF7E7ED2), width: 2) : null,
        ),
        child: Column(children: [Image.asset(img, height: 80), Text(label)]),
      ),
    );
  }
}