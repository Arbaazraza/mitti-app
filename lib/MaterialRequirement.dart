import 'dart:async';
import 'package:Mitti_the_app/main.dart';
import 'package:flutter/material.dart';



class MaterialRequirement extends StatefulWidget{
  const MaterialRequirement ({Key? key, required String title}) : super(key: key);

  @override
  _MaterialRequirementState  createState() => _MaterialRequirementState();
}
class _MaterialRequirementState extends State<MaterialRequirement >{
  // void initState(){
  //   super.initState();
  //   Timer(const Duration(seconds: 3),(){
  //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const MaterialRequirement(title: 'Material Prediction',)));
  //   });
  // }
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[

              const Text("Prediction Of Raw Material Based on Previous Orders",style: TextStyle(fontFamily: "Montserrat",color:  Color(0xffc9976b),fontSize: 25.0,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              const SizedBox(height: 10,),
              SizedBox(
                  width:350.0,
                  height:300.0,
                  child: Image.asset("assets/images/predict.JPG")),

              const Text("Predicted Value Of Clay",style: TextStyle(fontFamily: "Montserrat",color:  Color(0xffc9976b),fontSize: 25.0,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              SizedBox(
                  width:350.0,
                  height:150.0,
                  child: Image.asset("assets/images/PredictedValue.png")),


            ],
          ),
        )
    );
  }
}
