import 'package:bmi/models/bmi_model.dart';
import 'package:bmi/core/app_color.dart';
import 'package:bmi/view/widgets/containe_textbutton.dart';
import 'package:bmi/view_model/bmi_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class BmiResult extends StatefulWidget {
  //final BmiModel bmi;
  final double height;
  final double weight;
  final String name;
  final String birthdate;

  const BmiResult({
    super.key,
    required this.height,
    required this.weight,
    required this.name,
    required this.birthdate});

  @override
  State<BmiResult> createState() => _BmiResultState();
}

class _BmiResultState extends State<BmiResult> {
  int calculateAge(String birthdateText) {
    List<String> parts = birthdateText.split('/');
    DateTime birthdate = DateTime(
      int.parse(parts[2]),
      int.parse(parts[1]),
      int.parse(parts[0]),
    );

    DateTime today = DateTime.now();
    int age = today.year - birthdate.year;

    if (today.month < birthdate.month ||
        (today.month == birthdate.month && today.day < birthdate.day)) {
      age--;
    }

    return age;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BmiCubit>().getBmi(widget.height, widget.weight);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BmiCubit, BmiState>(
      builder: (context, state) {
        if (state is BmiLoading){
          return Center(child: CircularProgressIndicator());
        }else if(state is BmiSuccess){
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
                                  Text(widget.name,
                                    style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700,
                                        color: AppColor.white0,
                                        letterSpacing: 1.5),
                                  ),
                                  Text("${calculateAge(widget.birthdate)} years old",
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
                                Text(state.bmi.bmi.toStringAsFixed(1),
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
                                      Text(widget.height.toStringAsFixed(0),
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w700,
                                            color: AppColor.white0,
                                            letterSpacing: 0.5),
                                      ),
                                      const Text('Height',
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
                                    Text(widget.weight.toStringAsFixed(0),
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w700,
                                          color: AppColor.white0,
                                          letterSpacing: 0.5),
                                    ),
                                    const Text('Weight',
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
                    padding: const EdgeInsets.only(top: 25,bottom: 20),
                    child: Expanded(
                      child: Container(
                        width: 350,
                        //height: 320,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color:AppColor.green
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 7,top: 10),
                              child: Text(state.bmi.risk,
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 1.5,
                                  color: AppColor.white0,
                                ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom: 7),
                              child: Text(state.bmi.summary,
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: AppColor.white0,
                                ),),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 17,left: 20,bottom: 17),
                              child: Text(state.bmi.recommendation,
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
                  ),
                  Padding(
                      padding: const EdgeInsets.only(top: 29,bottom: 30),
                      child: ContaineTextbutton(
                        text: "Calculate BMI Again",
                        onPressed: (){
                          Navigator.of(context).pop();
                        },)
                  ),
                ],
              ),
            ),
          );
        }else if (state is BmiError){
          return Scaffold( // بدل return Center
            body: Center(child: Text("Error: ${state.message}")),
          );
        }else{
          return const SizedBox();
        }
      },
    );
  }
}
