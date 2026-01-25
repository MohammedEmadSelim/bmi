import 'package:bmi/bmi_form.dart';
import 'package:bmi/core/app_color.dart';
import 'package:flutter/material.dart';
class BmiResult extends StatelessWidget {
  const BmiResult({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            appBar: AppBar(automaticallyImplyLeading: false,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 350,
              height: 298,
              decoration: BoxDecoration(
                color: AppColor.purple0,
                borderRadius: BorderRadius.circular(20)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20,right: 49),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Samy Call',
                              style: TextStyle(
                                  fontSize: 22,
                              fontWeight: FontWeight.w700,
                              color: AppColor.white0,
                              letterSpacing: 1.5),
                            ),
                            Text('A 23 Years Old male',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: AppColor.white0,
                            ),),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('16.5',
                            style: TextStyle(
                                fontSize: 35,
                                fontWeight: FontWeight.w700,
                                color: AppColor.white0,
                                letterSpacing: 1.5),
                          ),
                          Text('BMI Calc',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: AppColor.white0,
                            ),),
                        ],
                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 22.5,),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text('180 cm',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      color: AppColor.white0,
                                      letterSpacing: 0.5),
                                ),
                                Text('Height',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: AppColor.white0,
                                  ),),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 50,
                            child: VerticalDivider(
                              color:AppColor.gray0,
                              width: 50,radius:BorderRadius.circular(2),
                              thickness: 3,
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text('70 Kg',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.white0,
                                    letterSpacing: 0.5),
                              ),
                              Text('Weight',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                  color: AppColor.white0,
                                ),),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/body.png')
                    ],
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 25,bottom: 29),
            child: Container(
              width: 350,
              height: 320,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:AppColor.green
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 7),
                    child: Text('Under Weight',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5,
                      color: AppColor.white0,
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,bottom: 7),
                    child: Text('Your BMI is less than 18.5',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColor.white0,
                      ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 17,left: 20,bottom: 17),
                    child: Text('Lorem ipsum dolor sit amet consectetur. Sagittis interdum dui enim imperdiet sapien cursus velit pharetra. Viverra justo tempor dictum odio. Nisl non dui integer orci nulla eget laoreet tellus. Orci nunc a orci convallis ac orci. Urna auctor at elementum sit ante maecenas ullamcorper rhoncus dictum. Morbi venenatis lectus ultrices euismod. Laoreet purus risus amet enim sagittis ut. Consectetur libero orci urnager dignissi est.',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: AppColor.white0,
                      ),),
                  ),
                ],
              ),
            ),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 29,bottom: 30),
          child: Container(
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
                  MaterialPageRoute(builder: (context) => BmiForm()),
                );
              },
              child: Text(
                'Calculate BMI Again',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.5,
                    color: Colors.white
                ),
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

