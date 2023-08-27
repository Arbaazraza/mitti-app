import 'dart:async';
import 'package:Mitti_the_app/main.dart';
import 'package:flutter/material.dart';


class SplashScreen extends StatefulWidget{
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}
class _SplashScreenState extends State<SplashScreen>{
  @override
  void initState(){
    super.initState();
    Timer(const Duration(seconds: 3),(){
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>const LoginPage(title: 'Login Page',)));
    });
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                  width:250.0,
                  height:200.0,
                  child: Image.asset("assets/images/img1.png")),
              const Text("MITTI",style: TextStyle(fontFamily: "Montserrat",color:  Color(0xffc9976b),fontSize: 25.0),),
              const SizedBox(height: 15,),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>( Color(0xffc9976b)),
              )
            ],
          ),
        )
    );
  }
}
