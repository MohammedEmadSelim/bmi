import 'package:flutter/material.dart';
// import 'package:flutter/src/painting/border_radius.dart';
import 'package:flutter/material.dart';
import 'screen2.dart';



class  Screen1 extends StatelessWidget {
  Screen1({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        // title: 'BMI App',
        // theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,),
        home: Scaffold(
          //appBar: AppBar(),
            body:  Column(

              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(15)),color: Colors.white,),
                  padding: EdgeInsets.symmetric(horizontal:10 ),

                  width: 320,
                  height: 380,
                  // decoration: BoxDecoration(borderRadius: BorderRadius.only(Radius topLeft: Radius.circular(25.0),Radius topRight = Radius.circular(25.0),), color: Colors.white,),
                  //  color: Colors.white,
                  child:  Image.asset("assets/images/first_img.png",width: 300,height: 100,alignment: Alignment.bottomLeft,),),
//SizedBox(height:1,),
                Container(

                  padding: EdgeInsets.all(10),
                  // alignment:Alignment.topRight,
                  width: 320,
                  height: 300,
                  decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)),color: Color(0xFF7876CD)),
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height:5,),

                      Text("  Know Your Body Better ,",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.w500),),
                      Text("  Get Your BMI Score in Less ",style: TextStyle(color: Colors.white,fontSize: 19),),
                      Text("  Than a Minute!",style: TextStyle(color: Colors.white,fontSize: 19),),
                      SizedBox(height: 25,),
                      Text(" It takes just 30 seconds-and your health is  ",style: TextStyle(color: Colors.white,fontSize: 13),),
                      Text(" worth it!   ",style: TextStyle(color: Colors.white,fontSize: 13),),
                      SizedBox(height: 26),
                      Divider(color: Colors.white54,),
                      SizedBox(height: 30),
                      _StartButton(),
                    ],
                  ) ,

                )
              ],
            )
        )

    );
  }
}class _StartButton extends StatelessWidget {
  const _StartButton();

  @override
  Widget build(BuildContext context) {
    return SizedBox(

      width: 280,
      height: 40,
      child: MaterialButton(
        onPressed: () {
          Navigator.push(context,   MaterialPageRoute(builder: (context) => Screen2()),);
        },color: Color(0xFF484783),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),

        child: const Text(
          "Get Started",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

