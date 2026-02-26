import 'package:bmi/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.title,
    this.controller,
    this.onTap,
    this.readonly = false,
    required this.hintText,
    required this.validator,
  });

  final String title;
  final TextEditingController? controller;
  final void Function()? onTap;
  final bool readonly;
  final String hintText;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: AppColor.gray2,
            ),
          ),
          SizedBox(height: 10),
          TextFormField(
            inputFormatters: [TextInputFormatter.withFunction(
                    (oldvalue,newvalue)=>newvalue.copyWith(text: newvalue.text.toLowerCase(),)
            )],
            controller: controller,
            readOnly: readonly,
            onTap: onTap,
            validator: validator,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: AppColor.gray,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}