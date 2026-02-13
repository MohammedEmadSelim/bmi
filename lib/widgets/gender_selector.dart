import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  final bool isMale;
  final Function(bool) onChanged;

  const GenderSelector({
    super.key,
    required this.isMale,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onChanged(true),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: isMale
                    ? const Color(0xFFD1D9E6)
                    : const Color(0xFFEFEFF5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(child: Text("Male")),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Expanded(
          child: GestureDetector(
            onTap: () => onChanged(false),
            child: Container(
              height: 120,
              decoration: BoxDecoration(
                color: !isMale
                    ? const Color(0xFFD1D9E6)
                    : const Color(0xFFEFEFF5),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Center(child: Text("Female")),
            ),
          ),
        ),
      ],
    );
  }
}
