import 'package:bmi/core/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.title,
    this.onTap,
    this.readOnly = false,
  });

  final TextEditingController? controller;

  final String title;
  final void Function()? onTap;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        SizedBox(height: 10),
        TextFormField(
          readOnly: readOnly!,
          onTap: onTap,
          controller: controller,
          style: TextStyle(color: AppColors.white),
          cursorColor: AppColors.white,
          decoration: InputDecoration(
            fillColor: AppColors.lightPurple,
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}