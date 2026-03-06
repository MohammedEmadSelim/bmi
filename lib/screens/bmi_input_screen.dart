import 'package:bmi/screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/bmi_cubit.dart';
import '../widgets/counter_widget.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/gender_card.dart';



class BmiInputScreen extends StatefulWidget {
  @override
  _BmiInputScreenState createState() => _BmiInputScreenState();
}

class _BmiInputScreenState extends State<BmiInputScreen> {
  int h = 180, w = 70;
  String g = 'male';
  final n = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text("BMI", style: TextStyle(color: Color(0xFF1D4D3F))), centerTitle: true),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              CustomTextField(label: "Name", controller: n),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(child: GenderCard(label: "Male", img: 'assets/male.png', isSelected: g == 'male', onTap: () => setState(() => g = 'male'))),
                  SizedBox(width: 15),
                  Expanded(child: GenderCard(label: "Female", img: 'assets/female.png', isSelected: g == 'female', onTap: () => setState(() => g = 'female'))),
                ],
              ),
              SizedBox(height: 20),
              CounterWidget(title: "Your Height(cm)", value: h, onChanged: (v) => setState(() => h = v)),
              SizedBox(height: 20),
              CounterWidget(title: "Your Weight(kg)", value: w, onChanged: (v) => setState(() => w = v)),
              SizedBox(height: 40),
              BlocConsumer<BmiCubit, BmiState>(
                listener: (context, state) {
                  print("Current State: $state");
                  if (state is BmiSuccess) {
                    Navigator.push(context, MaterialPageRoute(builder: (_) => ResultScreen(name: n.text,
                      gender: g,
                      height: h,
                      weight: w,
                      result: state.result,)));
                  }
                  else if (state is BmiError) {
                    print("API Error Details: ${state.msg}");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Error: ${state.msg}"), backgroundColor: Colors.red),
                    );
                  }
      
                },
                builder: (context, state) {
                  return ElevatedButton(
                    onPressed: state is BmiLoading ? null : () => context.read<BmiCubit>().calculate(h, w, 23, g),
                    style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF4C4C8D), minimumSize: Size(double.infinity, 55)),
                    child: state is BmiLoading ? CircularProgressIndicator(color: Colors.white) : Text("Calculate BMI", style: TextStyle(color: Colors.white)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}