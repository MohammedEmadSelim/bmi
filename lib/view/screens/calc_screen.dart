import 'package:bmi/core/theme/colors.dart';
import 'package:bmi/view/screens/Result.dart';
import 'package:bmi/view/widget/gender_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bmi/models/bmi_model.dart';
import 'package:bmi/view_model/repo.dart';

class CalcScreen extends StatefulWidget {
  const CalcScreen({super.key});
  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  GestureTapCallback? get onIncreamentTap => null;

  GestureTapCallback? get onDecrementTap => null;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController birthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  var flag = 0;
  MainAppRepo repo = MainAppRepo();
  void onIncreamentHeight() {
    if (heightController.text.isNotEmpty) {
      var value = int.parse(heightController.text);
      value++;
      heightController.text = value.toString();
    }
  }

  void onDecreamentHeight() {
    if (heightController.text.isNotEmpty) {
      var value = int.parse(heightController.text);
      value--;
      heightController.text = value.toString();
    }
  }

  void onIncreamentWeight() {
    if (weightController.text.isNotEmpty) {
      var value = int.parse(weightController.text);
      value++;
      weightController.text = value.toString();
    }
  }

  void onDecreamentWeight() {
    if (weightController.text.isNotEmpty) {
      var value = int.parse(weightController.text);
      value--;
      weightController.text = value.toString();
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    birthController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController? controller;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                "BMI",
                style: TextStyle(
                  color: ColorsUsed.deepgree,
                  fontSize: 40,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
            SizedBox(height: 10),
            Text("Name"),
            SizedBox(height: 5),
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                fillColor: ColorsUsed.lightcolor,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text("Birth"),
            SizedBox(height: 5),
            TextFormField(
              controller: birthController,
              readOnly: true,
              onTap: () async {
                var date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (date != null) {
                  birthController.text = date.toString();
                }
              },
              decoration: InputDecoration(
                fillColor: ColorsUsed.lightcolor,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 10),
            Text("Choose Gender"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      flag = 0;
                    });
                  },
                  child: GenderCard(
                    image: "assets/images/male.png",
                    title: "Male",
                    selected: flag == 0 ? true : false,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      flag = 1;
                    });
                  },
                  child: GenderCard(
                    image: "assets/images/female.png",
                    title: "Female",
                    selected: flag == 1 ? true : false,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            Text("Your Height"),
            SizedBox(height: 3),
            TextFormField(
              controller: heightController,

              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: onIncreamentHeight,
                  child: Icon(Icons.add, size: 20),
                ),
                prefixIcon: GestureDetector(
                  onTap: onDecreamentHeight,
                  child: Icon(Icons.remove, size: 20),
                ),
                fillColor: ColorsUsed.lightcolor,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 5),
            Text("Your Weight"),
            SizedBox(height: 3),
            TextFormField(
              controller: weightController,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                  onTap: onIncreamentWeight,
                  child: Icon(Icons.add, size: 20),
                ),
                prefixIcon: GestureDetector(
                  onTap: onDecreamentWeight,
                  child: Icon(Icons.remove, size: 20),
                ),
                fillColor: ColorsUsed.lightcolor,
                filled: true,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
            SizedBox(height: 15),
            Center(
              child: SizedBox(
                child: ElevatedButton(
                  onPressed: () async {
                    Map<String, dynamic> res = await repo.calcBmi(
                      weightController.text,
                      heightController.text,
                    );
                    var data = BmiModel.fromJson(res);
                    // ignore: use_build_context_synchronously
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Result(
                          bmi_model: data,
                          name: nameController.text,
                          birth: birthController.text,
                        ),
                      ),
                    );
                  },

                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsUsed.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),

                  child: const Text(
                    "Calculate BMI",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
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
