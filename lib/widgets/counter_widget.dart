import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  final String title;
  final int value;
  final Function(int) onChanged;
  CounterWidget({required this.title, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(color: Color(0xFFF0F0FF), borderRadius: BorderRadius.circular(10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: Icon(Icons.remove, color: Color(0xFF4C4C8D)), onPressed: () => onChanged(value - 1)),
              Text("$value", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              IconButton(icon: Icon(Icons.add, color: Color(0xFF4C4C8D)), onPressed: () => onChanged(value + 1)),
            ],
          ),
        )
      ],
    );
  }
}