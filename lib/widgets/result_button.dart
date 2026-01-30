import 'package:flutter/material.dart';
import 'package:bmi/onboarding.dart';

class ResultButton extends StatelessWidget {
  const ResultButton({super.key});

  @override
  Widget build(BuildContext context) {
    return             SizedBox(
      width: double.infinity ,
      child: ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Onboarding())) ;}, style:ElevatedButton.styleFrom(
        backgroundColor: Colors.deepPurpleAccent,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),),child: Text("Calculate BMI Again" ,style: TextStyle(color: Colors.white),),),
    )
    ;
  }
}
