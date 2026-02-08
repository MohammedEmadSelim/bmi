import 'package:flutter/material.dart';

class GenderSelector extends StatelessWidget {
  final String selectedGender;
  final Function(String) onSelect;

  const GenderSelector({super.key, required this.selectedGender, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        _genderItem('Male', 'assets/male.png'),
        _genderItem('Female', 'assets/female.png'),
      ],
    );
  }

  Widget _genderItem(String gender, String path) {
    bool isSelected = selectedGender == gender;
    return GestureDetector(
      onTap: () => onSelect(gender),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFC7D2FE) : const Color(0xFFF0F2FF),
          borderRadius: BorderRadius.circular(20),
          border: isSelected ? Border.all(color: const Color(0xFF4C51BF), width: 2) : null,
        ),
        child: Image.asset(path, height: 80),
      ),
    );
  }
}