import 'package:flutter/material.dart';

class HeightSelector extends StatelessWidget {
  final int height;
  final Function(int) onChanged;

  const HeightSelector({
    super.key,
    required this.height,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () => onChanged(height - 1),
          icon: const Icon(Icons.remove),
        ),
        Text("$height",
            style: const TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold)),
        IconButton(
          onPressed: () => onChanged(height + 1),
          icon: const Icon(Icons.add),
        ),
      ],
    );
  }
}
