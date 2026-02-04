import 'package:bmi/core/colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key,
    this.controller,
    required this.title,
     this.readOnly = false,
    this.onTap,

  });

  final TextEditingController? controller;
  final String title ;
  final void Function()? onTap;
  final bool readOnly;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
              ),
            )
          ],
        ),
        SizedBox(height: 10,),
        TextFormField(
          readOnly: readOnly ,
          onTap: onTap,
          controller: controller,
          style: TextStyle(color: AppColors.black),
          cursorColor: AppColors.black,
          decoration: InputDecoration(
            fillColor: Color(0xffe4d9ff),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)
            ),
          ),
        ),
      ],
    );
  }
}
