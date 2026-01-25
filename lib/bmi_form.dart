import 'package:bmi/core/app_color.dart';
import 'package:flutter/material.dart';
import 'bmi_result.dart';

class BmiForm extends StatelessWidget {
  const BmiForm({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false),
      body: Center(
        child: Column(
          children: [
            Text(
              'BMI',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.w900,
                letterSpacing: 20,
                color: Colors.green[900],
              ),
            ),
            SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                  Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: AppColor.gray2,
                    ),
                  ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(right: 25),
                child: TextField(decoration:InputDecoration(
                  fillColor: AppColor.gray,
                  filled: true,
                  border: OutlineInputBorder(borderRadius:BorderRadius.circular(10),),
                ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Birth Date',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColor.gray2,
                ),
              ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: TextField(decoration:InputDecoration(
                    fillColor: AppColor.gray,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(10),),

                  ),
                  ),
                ),
              SizedBox(height: 20,),
              Text(
                'Choose Gender',
                style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.w500,
                  color: AppColor.gray2,
                ),
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Container(
                        width:100,
                          height:100 ,
                          decoration: BoxDecoration(color: AppColor.gray,borderRadius: BorderRadius.circular(10)),
                          child: Image.asset('assets/images/male.png',)
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Male',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColor.gray2,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 25),
                    child: Column(
                      children: [
                        Container(
                            width:100,
                            height:100 ,
                            decoration: BoxDecoration(color: AppColor.gray,borderRadius: BorderRadius.circular(10)),
                            child: Image.asset('assets/images/female.png')),
                        SizedBox(height: 10),
                        Text(
                          'Female',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: AppColor.gray2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 21),
              Text(
                'Your Height (cm)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColor.gray2,
                ),
              ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: TextField(decoration:InputDecoration(
                    fillColor: AppColor.gray,
                    filled: true,
                    border: OutlineInputBorder(borderRadius:BorderRadius.circular(10),),
                    prefixIcon: Icon(Icons.remove),
                    suffixIcon: Icon(Icons.add)
                  ),
                  ),
                ),
              SizedBox(height: 5),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(1),
                  color: Colors.white10,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Your weight (kg)',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColor.gray2,
                ),
              ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(right: 25),
                  child: TextField(decoration:InputDecoration(
                      fillColor: AppColor.gray,
                      filled: true,
                      border: OutlineInputBorder(borderRadius:BorderRadius.circular(10),),
                      prefixIcon: Icon(Icons.remove),
                      suffixIcon: Icon(Icons.add)
                  ),
                  ),
                ),
              ],),
            ),
            SizedBox(height: 5),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                color: Colors.white10,
              ),
            ),
            SizedBox(height: 40),
            Container(
              width: 332,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColor.purple1,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BmiResult()),
                  );
                },
                child: Text(
                  'Calculate BMI',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5,
                    color: Colors.white
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

