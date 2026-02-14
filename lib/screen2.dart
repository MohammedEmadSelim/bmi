import 'package:flutter/material.dart';

import 'screen3.dart ';

void main(){
  runApp(Screen2());
}
class Screen2 extends StatefulWidget {
  @override
  State<Screen2> createState() =>_result();

}
class _result extends  State<Screen2>{
  String ?SelectGender;
  TextEditingController heightController = TextEditingController(text: '0');
  TextEditingController weightController = TextEditingController(text: '0');
  void increment(TextEditingController controller) {
    int currentValue = int.tryParse(controller.text) ?? 0;
    currentValue++;
    controller.text = currentValue.toString();
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(




        debugShowCheckedModeBanner: false,
        home: Scaffold(
          //  appBar: AppBar(),
            body:Expanded(child:
            Container(height: 800,width: 500,color:Colors.white,

              padding: EdgeInsets.all(10),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child:Icon(Icons.arrow_back),
                  ),

                  SizedBox(height: 20,),
                  Row(mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("BMI",style: TextStyle(color: Color(0xFF01502E),fontSize:30,fontWeight:FontWeight.w500 ),),],),
                  SizedBox(height: 10,),
                  Text("Name",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.black),),
                  SizedBox(height: 5,),
                  TextField(decoration: InputDecoration(
                      fillColor: Colors.grey[250],
                      filled: true,
                      border:  OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(20)) )
                  ),  ),
                  SizedBox(height: 10,),
                  Text("Birth Date",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.black),),
                  SizedBox(height: 5,),
                  TextField(decoration: InputDecoration(
                      fillColor: Colors.grey[250],
                      filled: true,
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20)))

                  ), ),
                  SizedBox(height: 10,),
                  Text("Choose Gender",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.black),),
                  SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
                        child: ElevatedButton(onPressed: (){ setState(() {
                          SelectGender  = 'male';
                        }); }, child: Image.asset("assets/images/Group.png",width: 80,height: 80,)),

                      ),
                      SizedBox(width: 25,),
                      Container(
                        child: ElevatedButton(onPressed: (){
                          setState(() {
                            SelectGender='Female';
                          });
                        }, child: Image.asset("assets/images/female.png",width: 80,height: 80,)),
                      )
                    ],
                  ),
                  Row(
                    children: [
                      SizedBox(width: 55,),
                      Text("Male",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.black),),
                      SizedBox(width: 130,),
                      Text("Female",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.black),),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 7,),
                      Text("Your Height(cm)",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.black),),
                      SizedBox(height: 7,),
                      Container(
                        width: 330,height: 45,
                        child:
                        TextField(
                          controller: heightController,

                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            fillColor: Colors.grey[250],
                            filled: true,

                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            suffix: IconButton(
                              onPressed: () {
                                increment(heightController);
                              },
                              icon: Icon(Icons.add),
                            ),

                          ),  ),),

                      SizedBox(height: 7,),
                      Text("Your Weight(kg)",style: TextStyle(fontSize: 13,fontWeight: FontWeight.w500,color: Colors.black),),
                      SizedBox(height: 7,),
                      Container(width: 330,height: 45,
                        child:
                        TextField(
                          controller: weightController,

                          decoration: InputDecoration(

                            fillColor: Colors.grey[250],
                            filled: true,
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
                            suffix: IconButton(
                              onPressed: () {
                                increment(weightController);
                              },
                              icon: Icon(Icons.add),
                            ),

                          ),  ),)
                    ],
                  ),
                  SizedBox(height: 40,),


                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton( onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: ( context)=>Screen3()));

                        }

                            ,style: ElevatedButton.styleFrom(
                              backgroundColor:Color(0xFF484783),
                              foregroundColor:Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),

                              ),
                              fixedSize: Size(280, 45),

                            ),


                            child: Text("Calculate BMI" ))]
                  )


                ],


              ),



            ),
            )) );

  }
}

class ResultPage extends StatelessWidget {
  final double bmi;

  ResultPage({required this.bmi});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI Result"),
        backgroundColor: Color(0xFF01502E),
      ),
      body: Center(
        child: Text(
          bmi.toStringAsFixed(2),
          style: TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
            color: Color(0xFF01502E),
          ),
        ),
      ),
    );
  }
}

