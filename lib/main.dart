//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Screens/tasks_screen.dart';

void main(){
  runApp(AbdoApp());
}

class AbdoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return MaterialApp(
      home: TasksScreen(),
    );

  }

}