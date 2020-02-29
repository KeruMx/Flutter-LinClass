import 'package:flutter/material.dart';
import 'package:linclass/Login.dart';
import 'package:linclass/Cursos.dart';
import 'package:splashscreen/splashscreen.dart';

import 'dashboard.dart';
void main()=>runApp(Splash());
class Splash extends StatefulWidget{
  var uri = "http://192.168.43.84:8888/";
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SplashForm();
  }

}
class SplashForm extends State<Splash>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      routes: {
        '/login'  : (context)=>Login(),
        '/dash'   : (context)=>Dashboard(),
        '/course' : (context)=>Cursos()
      },
      home: SplashScreen(
        seconds: 5,
        image: Image.network("https://raw.githubusercontent.com/KeruMx/LincHub/paginasDinamicas/images/LincHub.png"),
        navigateAfterSeconds: Login(),
        title: Text("Bienvenido a LinClass",
        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20.0),
        ),
        gradientBackground: new LinearGradient(colors: [Colors.white, Colors.green], begin: Alignment.center, end: Alignment.bottomCenter),
      ),
    );
  }

}