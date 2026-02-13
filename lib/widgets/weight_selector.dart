import 'package:flutter/material.dart';

class WeightSelector extends StatelessWidget {
  final int weight;
  final Function(int) onChanged;

  const WeightSelector({
    super.key,
    required this.weight,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => onChanged(weight - 1),
          icon: const Icon(Icons.remove),
        ),
        Text("$weight",
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold)),
        IconButton(
          onPressed: () => onChanged(weight + 1),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
