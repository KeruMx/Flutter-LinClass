import 'package:flutter/material.dart';
import 'package:linclass/Login.dart';
import 'package:linclass/main.dart';
import 'package:splashscreen/splashscreen.dart';
class Splash extends StatefulWidget{
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