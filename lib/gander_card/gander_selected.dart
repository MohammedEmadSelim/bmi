import 'package:bmi/core/colors.dart';
import 'package:flutter/cupertino.dart';

class GanderSelected extends StatelessWidget {
  const GanderSelected({super.key,
    required this.image,
    required this.title,
    required this.selected
  });

  final String image;
  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      decoration: BoxDecoration(
        border: BoxBorder.fromBorderSide(
            selected ? BorderSide(color: AppColors.green) : BorderSide.none ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10 , top: 10 , right: 10),
            decoration: BoxDecoration(
              color: Color(0xffe4d9ff),
              borderRadius: BorderRadius.circular(16)
            ),
            child: Image.asset(image , width: 111, height: 100,),
          ),
          SizedBox(height: 4,),
          Text(title,
            style: TextStyle(fontSize: 15 , fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
