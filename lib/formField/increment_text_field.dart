import 'package:bmi/core/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IncrementTextField extends StatelessWidget {
  const IncrementTextField({super.key,
    this.controller,
    required this.title,
    this.onIncrement,
    this.onDecrement
  });

  final TextEditingController? controller;
  final String title;
  final void Function()? onIncrement;
  final void Function()? onDecrement;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(title, style: TextStyle(fontSize: 16 , fontWeight: FontWeight.w500),),
            )
          ],
        ),
        SizedBox(height: 10,),
        TextFormField(
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          textAlign: TextAlign.center,
          controller: controller,
          style: TextStyle(color: AppColors.black),
          cursorColor: AppColors.white,
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
              onTap: onIncrement,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Icon(Icons.add, size: 32,),
              ),
            ),
            prefixIcon: GestureDetector(
              onTap: onDecrement,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Icon(Icons.remove , size:32),
              ),
            ),
            fillColor: Color(0xffe4d9ff),
            filled: true,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(10)
            ),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(10)
            ),
          ),

        )
      ],
    );
  }
}
