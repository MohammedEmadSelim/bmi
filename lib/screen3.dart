import 'package:flutter/material.dart';
import 'screen2.dart ';
void main(){
  runApp(Screen3());
}
class Screen3 extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // throw UnimplementedError();

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          //  appBar: AppBar(),
            body: Expanded(child: Column(

              mainAxisAlignment: MainAxisAlignment.start,
              children: [Row(children:
              [
                ElevatedButton(onPressed: (){Navigator.pop(context);
                }, child: Icon(Icons.arrow_back)),]),
                SizedBox(height: 8,),
                Container( height: 250,
                    decoration: BoxDecoration(color: Color(0xFF7876CD),borderRadius: BorderRadius.all(Radius.circular(20))),
                    padding: EdgeInsets.all(15),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 7,),
                            Text("Samy Call",style: TextStyle(color: Colors.white,fontSize: 20),),
                            Text("A 23 years old male.",style: TextStyle(color: Colors.white,fontSize: 12),),
                            SizedBox(height: 5,),
                            Column(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              // crossAxisAlignment:CrossAxisAlignment.center ,
                              children: [
                                Text("      16.5",style: TextStyle(color: Colors.white,fontSize: 28,fontWeight:FontWeight.w700),),
                                Text("            BMI Calc ",style: TextStyle(color: Colors.white,fontSize: 15,fontWeight:FontWeight.w300),),

                              ],

                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              //  crossAxisAlignment: CrossAxisAlignment.,
                              children: [
                                Column(
                                  children: [
                                    SizedBox(height:  14,),
                                    Text("  180 CM",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight:FontWeight.w500),),
                                    SizedBox(height:8 ,),
                                    Text("   Height",style: TextStyle(color: Colors.white,fontSize:10,fontWeight:FontWeight.w700),),
                                  ],
                                ),
                                SizedBox(width: 15,),
                                Column(
                                  children: [
                                    SizedBox(height:  14,),
                                    Text(" 70 Kg",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight:FontWeight.w500),),
                                    SizedBox(height: 8,),
                                    Text("   Weight",style: TextStyle(color: Colors.white,fontSize:10,fontWeight:FontWeight.w700),),
                                  ],
                                )
                              ],
                            )
                          ],

                        ),
                        SizedBox(width: 40,),
                        Image.asset("assets/images/Vector.png"),
                      ],
                    )
                ),


                Container(
                  height: 280,decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Color(0xFF01502E),),
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(10),
                  child:
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      SizedBox(height: 10,),

                      Text("Under Weight",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight:FontWeight.w500),),
                      SizedBox(height: 5,),
                      Text("Your BMI Is Less Than 18.5",style: TextStyle(color: Colors.white,fontSize:12,fontWeight:FontWeight.w500),),
                      SizedBox(height: 5,),
                      Text("Lorem ipsum dolor sit amet consectetur. Sagittis interdum dui enim imperdiet sapien cursus velit pharetra. Viverra justo tempor dictum odio. Nisl non dui integer orci nulla eget laoreet tellus. Orci nunc a orci convallis ac orci. Urna auctor at elementum sit ante maecenas ullamcorper rhoncus dictum. Morbi venenatis lectus ultrices euismod. Laoreet purus risus amet enim sagittis ut. Consectetur libero orci urnager dignissi est.",style: TextStyle(color: Colors.white,fontSize:11,fontWeight:FontWeight.w200),),
                    ],
                  ),

                ),
                SizedBox(height: 20,),
                Expanded(child:  Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Color(0xFF484783),),
                  margin: EdgeInsets.only(bottom:25),
                  //margin: EdgeInsets.symmetric(vertical: 10),

                  padding: EdgeInsets.all(1),
                  height: 3,
                  child:  MaterialButton
                    (onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen2()));
                  },
                    child:  Text('Calculate BMI Again',style: TextStyle(color: Colors.white,),),
                    minWidth: 250,
                    height:2,

                  ),
                )
                )  ],

            ),)

        ) );




  }
}