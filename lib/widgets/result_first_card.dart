import 'package:flutter/material.dart';

class ResultFirstCard extends StatelessWidget {

  final String name;
  final String age;
  final String gender;
  final String bmiScore;
  final String height;
  final String weight;

  const ResultFirstCard({
  super.key,
  required this.name,
  required this.age,
  required this.gender,
  required this.bmiScore,
  required this.height,
  required this.weight,
  });
  

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.deepPurpleAccent
        ,
        borderRadius: BorderRadius.circular(7),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(name, style: TextStyle(

                    fontSize: 24 ,
                    color: Colors.white
                ),),
                SizedBox(height: 5,),
                Text("A $age year old male.",style: TextStyle(fontSize: 12 , color: Colors.white)
                  ,
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Column(
                      children: [
                        Text("$bmiScore" , style: TextStyle(fontSize: 28 , fontWeight: FontWeight.bold , color: Colors.white),)
                        ,                            Text("BMI Calc" , style: TextStyle(fontSize: 16 ,  color: Colors.white),),
                        SizedBox(height: 10,)
                        ,
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text("$height CM",style: TextStyle(color: Colors.white , fontSize: 16),),
                                  Text("Height",style: TextStyle(fontSize: 10 , color: Colors.white , ),)
                                ],
                              ) ,
                              const SizedBox(width: 20),

                              const VerticalDivider(
                                color: Colors.white,
                                thickness: 1,
                              ),

                              const SizedBox(width: 20),

                              Column(
                                children: [
                                  Text("$weight kg",style: TextStyle(color: Colors.white , fontSize: 16),),
                                  Text("Weight",style: TextStyle(fontSize: 10 , color: Colors.white , ),)
                                ],
                              ) ,

                            ],
                          ),
                        )

                      ],
                    )
                  ],
                )
              ],
            ),
            Spacer(),
            Image.asset("assets/body.png",
              fit: BoxFit.contain,)
          ],
        ),
      ),
    )
    ;
  }
}
