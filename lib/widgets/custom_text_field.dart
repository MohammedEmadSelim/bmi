import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
final String label;
final TextEditingController controller;
CustomTextField({required this.label, required this.controller});

@override
Widget build(BuildContext context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(label),
      SizedBox(height: 8),
      TextField(
        controller: controller,
        decoration: InputDecoration(
          fillColor: Color(0xFFF0F0FF),
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
        ),
      ),
    ],
  );
}
}