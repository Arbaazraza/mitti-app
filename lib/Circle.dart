import 'dart:async';
import 'package:Mitti_the_app/MaterialRequirement.dart';
import 'package:Mitti_the_app/main.dart';
import 'package:flutter/material.dart';


class Circle extends StatefulWidget{
  const Circle({Key? key, required String title}) : super(key: key);

  @override
  _CircleState createState() => _CircleState();
}
class _CircleState extends State<Circle>{
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const MaterialRequirement(title: 'Material Prediction',)));
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>( Color(0xffc9976b)),
              )
            ],
          ),
        )
    );
  }
}
