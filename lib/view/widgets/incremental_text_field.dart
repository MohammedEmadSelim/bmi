import 'package:bmi_app/core/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IncrementalTextFormField extends StatelessWidget {
  const IncrementalTextFormField({
    super.key,
    this.controller,
    required this.title,
    this.onIncrementTap,
    this.onDecrementTap,
  });
  final TextEditingController? controller;
  final String title;
  final void Function()? onIncrementTap;
  final void Function()? onDecrementTap;
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
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textAlign: TextAlign.center,
          controller: controller,
          style: TextStyle(color: AppColors.white),
          cursorColor: AppColors.white,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: onIncrementTap,
              child: Icon(Icons.add, size: 28),
            ),
            prefixIcon: GestureDetector(
              onTap: onDecrementTap,
              child: Icon(Icons.remove, size: 28),
            ),
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
