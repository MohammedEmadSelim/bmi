import 'package:bmi/core/app_color.dart';
import 'package:flutter/material.dart';
import 'package:bmi/view/screens/bmi_form.dart';
import 'package:flutter/services.dart';

class IncTextFieldDec extends StatelessWidget {
  const IncTextFieldDec({super.key,
    required this.title,
    this.controller,
    required this.readonly,
    required this.hintText,
    required this.onIncrement,
    required this.onDecrement,
  });

  final String title;
  final TextEditingController? controller;
  final bool readonly;
  final String hintText;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25),
      child: Column(
        children: [
          Row(
            children: [
              Text(title,
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColor.gray2),)
            ],
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: controller,
            readOnly: readonly,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor: AppColor.gray,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              suffixIcon: IconButton(onPressed: onIncrement, icon: Icon(Icons.add)),
              prefixIcon: IconButton(onPressed: onDecrement, icon: Icon(Icons.remove))
            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
