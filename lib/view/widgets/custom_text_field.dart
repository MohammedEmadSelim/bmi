import 'package:bmi/core/app_color.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
   CustomTextFormField({
    super.key,
    required this.title,
    this.controller,
    this.readonly=false,
    this.onTap,
    required this.hintText,
  });

  final String title;
  final TextEditingController? controller ;
  final void Function()? onTap;
  final bool? readonly;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25,right: 25),
      child: Column(
        children: [
          Row(
            children: [
              Text(title,
              style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColor.gray2),),
            ],
          ),
          SizedBox(height: 10,),
          TextFormField(
            controller: controller,
            readOnly: readonly!,
            onTap: onTap,
            decoration: InputDecoration(
              hintText: hintText,
              filled: true,
              fillColor:AppColor.gray,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),
    );

  }
}
