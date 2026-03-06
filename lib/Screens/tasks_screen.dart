import 'package:flutter/material.dart';

class TasksScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    //throw UnimplementedError();
    return Scaffold(
        backgroundColor: Colors.teal[400],
        body: Container(
          padding: const EdgeInsets.only(
            top:60,
            left:20,
            right:20,
            bottom:80,
          ),
          child:
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.playlist_add_check ,
                    size: 40,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20),
                  Text("ToDayDo" , style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),)
                ],
              ),
              Text("4 Tasks" , style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              ),
              Expanded(
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                ),
              )
            ],
          ),)

    );

  }


}