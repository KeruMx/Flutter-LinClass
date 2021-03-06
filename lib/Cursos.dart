import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'Login.dart';
import 'main.dart';
import 'dashboard.dart';


class Cursos extends StatefulWidget{
  @override
  State<StatefulWidget> createState(){
    return CursosForm();
  }
}

class CursosForm extends State<Cursos>{
  var isLoading=false;
  List dataCursos;
  TextEditingController txtName = TextEditingController();
  TextEditingController txtDesc = TextEditingController();
  var uriCourses = Splash().uri;
  Future<int> inCurso() async{
    setState(() {
      isLoading = true;
    });
    var name = txtName.text;
    var desc = txtDesc.text;

    Map<String,String> headers = {"Content-type":"application/json"};
    String cadJSON = '{"name":"$name","description":"$desc","idTeacher":{"id":1}}';
    var response = await http.post(
      Uri.encodeFull(uriCourses+"courses"),
      headers: headers,
      body: cadJSON
    );
    var response2=await http.get(
        Uri.encodeFull(uriCourses+"courses"),
        headers: {"Acept": "application/json"}
    );
    setState(() {
      isLoading = false;
      dataCursos = json.decode(response2.body);
    });
  }
  Future<String> gerCursos() async{
    this.setState((){
      isLoading=true;
    });
    var response=await http.get(
        Uri.encodeFull(uriCourses+"courses"),
        headers: {"Acept": "application/json"}
    );
    this.setState((){
      isLoading=false;
      dataCursos=json.decode(response.body);
    });
    return "Accept";
  }
  @override
  void initState() {
    // TODO: implement initState
    gerCursos();
    super.initState();
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
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                    return AlertDialog(
                      title: Text("New Course"),
                      content: Form(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(hintText: "Name of Course"),
                              controller: txtName,
                            ),
                            TextField(
                              decoration: InputDecoration(hintText: "Description of Course"),
                              controller: txtDesc,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 20, right: 20),
                              child: RaisedButton(
                                  child: Text("Save Course"),
                                  onPressed: (){
                                    inCurso();
                                    Navigator.pop(context);
                                  }
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  }
              );
            },
        ),
        body: isLoading ? Center(child: CircularProgressIndicator(),)
            : ListView.builder(
          itemCount: dataCursos==null ? 0 : dataCursos.length,
          itemBuilder: (BuildContext context, int index) {
            return Slidable(
              actionPane: SlidableDrawerActionPane(),
              actionExtentRatio: 0.25,
              child: Card(
                elevation: 8.0,
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                child: Container(
                  decoration: BoxDecoration(color: Color.fromRGBO(121, 181, 237, .9)),
                  child: ListTile(
                    contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                    leading: Container(
                        padding: EdgeInsets.only(right: 12.0),
                        decoration: BoxDecoration(
                            border: Border( right: BorderSide(width: 1.0, color: Colors.black))
                        ),
                        child: Icon(Icons.language, color: Colors.black)
                    ),

                    title: Text(
                      dataCursos[index]['name'],
                      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                    ),

                    subtitle: Row(
                      children: <Widget>[
                        //Icon(Icons.touch_app, color: Colors.yellowAccent),
                        Text(dataCursos[index]['description'], style: TextStyle(color: Colors.black))
                      ],
                    ),

                    trailing: Icon(Icons.keyboard_arrow_right, color: Colors.black, size: 30.0,),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}