import 'package:bmi/core/app_const.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.controller,
    this.onTap,
    this.readOnly = false,
    required this.textInputType,
  });

  final TextEditingController? controller;

  final TextInputType textInputType;

  final VoidCallback? onTap;

  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 25),
      child: TextField(
        readOnly: readOnly,
        controller: controller,
        onTap: onTap,
        keyboardType: textInputType,
        decoration: InputDecoration(
          fillColor: AppColors.primary,
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
