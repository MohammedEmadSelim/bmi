import 'package:flutter/material.dart';

class ResultFirstCard extends StatelessWidget {
  const ResultFirstCard({super.key});

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
                Text("Samy Call", style: TextStyle(

                    fontSize: 24 ,
                    color: Colors.white
                ),),
                SizedBox(height: 5,),
                Text("A 23 year old male.",style: TextStyle(fontSize: 12 , color: Colors.white)
                  ,
                ),
                SizedBox(height: 15,),
                Row(
                  children: [
                    Column(
                      children: [
                        Text("16.5" , style: TextStyle(fontSize: 28 , fontWeight: FontWeight.bold , color: Colors.white),)
                        ,                            Text("BMI Calc" , style: TextStyle(fontSize: 16 ,  color: Colors.white),),
                        SizedBox(height: 10,)
                        ,
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  Text("180 CM",style: TextStyle(color: Colors.white , fontSize: 16),),
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
                                  Text("70 kg",style: TextStyle(color: Colors.white , fontSize: 16),),
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
