import 'package:flutter/material.dart';
import 'package:bmi/final_screen.dart';
class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment .center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Image.asset(
          "assets/img.png",
          height: 300,
          fit: BoxFit.contain,
        ) ,
            SizedBox(height: 5,)
            , Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),              color: Colors.deepPurpleAccent
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Know Your Body Better , Get Your BMI Score in Less Than a Minute!" , style: TextStyle(
                      fontSize: 28 , fontWeight: FontWeight.bold
                        ,color: Colors.white
                    ),)
                    , SizedBox(height: 10,),
                    Text("It takes just 30 seconds – and your health is worth it!" , style: TextStyle(color: Colors.white),),
                     SizedBox(height: 20,),
                    Divider(),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>FinalScreen()));
                      },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white
                          ,foregroundColor: Colors.deepPurple
                          )
                          ,child:Text("Get Started")),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
