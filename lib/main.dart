import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main()=>runApp(Cursos());

class Cursos extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return CursosForm();
  }
}

class CursosForm extends State<Cursos>{
  var isLoading=false;
  List dataCursos;

  Future<String> gerCursos() async{
    this.setState((){
      isLoading=true;
    });
    var response=await http.get(
        Uri.encodeFull("http://1.1.1.1:8888/courses"),
        headers: {"Acept": "application/json"}
    );
    this.setState((){
      isLoading=false;
      dataCursos=json.decode(response.body);
    });
    return "Accept";
  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Cursos"),
          backgroundColor: Colors.lightGreen,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add_circle),
          onPressed: (){
            //Accion del boton

          },
        ),
        body: isLoading ? Center(child: CircularProgressIndicator(),)
            :ListView.builder(
          itemCount: dataCursos==null ? 0 : dataCursos.length,
          itemBuilder: (BuildContext context, int index) {



          },
        ),
      ),
    );
  }
}