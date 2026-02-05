import 'package:bmi/core/app_color.dart';
import 'package:flutter/material.dart';

class GenderType extends StatelessWidget {
  const GenderType({
    super.key,
    required this.title,
    required this.image,
    required this.isSelected,
  });

  final String title;
  final String image;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(width: 3,
                  color: isSelected ? Colors.blue:Colors.grey
              ),
            ),
            child: Image.asset(image),
          ),
          SizedBox(height: 10,),
          Text(title,
            style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500,color: AppColor.gray2),),
        ],
      ),



    );
  }
}
