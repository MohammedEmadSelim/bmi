import 'package:bmi/core/app_const.dart';
import 'package:flutter/material.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({required this.text,required this.onPressed,super.key});
  final  VoidCallback onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 330,
        height: 45,
        decoration: BoxDecoration(
          color: AppColors.burble,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextButton(
          onPressed:onPressed,
          child: Text(text ,style: TextStyle(
            color: Colors.white,
                fontSize: 16
          ),),
        ),
      ),
    );
  }
}
