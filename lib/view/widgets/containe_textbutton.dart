import 'package:flutter/material.dart';

import '../../core/app_color.dart';

class ContaineTextbutton extends StatelessWidget {
  const ContaineTextbutton({super.key, required this.text, this.onPressed});

  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 332,
      height: 45,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColor.purple1,
      ),
      child: TextButton(
        onPressed:onPressed,
        child: Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.5,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}