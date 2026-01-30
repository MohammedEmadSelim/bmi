import 'package:bmi/onboarding.dart';
import 'package:flutter/material.dart';

class FinalScreen extends StatelessWidget {
  const FinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
            ),
            SizedBox(height: 15,),
            Container(
              decoration: BoxDecoration(
                color: Colors.green
                    ,
                borderRadius: BorderRadius.circular(7)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text("Under Weight", style: TextStyle(color: Colors.white ,
                        fontSize: 20 ,
                           fontWeight: FontWeight.bold
                        ),

                        ),
                      ],
                    )
               , Row(
                 children: [
                   Text("Your BMI is less than 18.5", style: TextStyle(color: Colors.white ,
                      fontSize: 14 ,
                                 ),
                    ),
                 ],
               ),
                    SizedBox(height: 7,),
                    Text("Lorem ipsum dolor sit amet consectetur. Sagittis interdum dui enim imperdiet sapien cursus velit pharetra. Viverra justo tempor dictum odio. Nisl non dui integer orci nulla eget laoreet tellus. Orci nunc a orci convallis ac orci. Urna auctor at elementum sit ante maecenas ullamcorper rhoncus dictum. Morbi venenatis lectus ultrices euismod. Laoreet purus risus amet enim sagittis ut. Consectetur libero orci urnager dignissi est."
                    , style: TextStyle(color: Colors.white
                      , fontSize: 14 ,

                      ),
                    ) ,
                    SizedBox(height: 10,)
                ],
                ),
              ),
            ) ,
            SizedBox( height: 25,),
            SizedBox(
              width: double.infinity ,
              child: ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Onboarding())) ;}, style:ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),),child: Text("Calculate BMI Again" ,style: TextStyle(color: Colors.white),),),
            )
          ],
        ),
      ),
    );
  }
}
