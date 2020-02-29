import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dashboard.dart';


class Login extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }
}

class LoginState extends State<Login>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final txtUserController = TextEditingController();
    final txtPwdController = TextEditingController();
    final txtUsuario = TextEditingController();
    final txtContrasena = TextEditingController();
    bool recordarLogin = false;

    loggued() async{
      var logueado;
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      logueado = prefs.getBool("logueado") ?? false;
      if (logueado)
        Navigator.pushReplacementNamed(context, '/dash');
    }

    final logo = CircleAvatar(
      radius: 45.0,
      child: Image.network("https://dms.com.pe/wp-content/uploads/2017/02/acceso-web.png"),
    );
    final txtUser = TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: txtUserController,
      decoration: InputDecoration(
        hintText: "Introduce el Usuario",
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(45.0))
      ),
    );
    final txtPwd = TextFormField(
      controller: txtPwdController,
      obscureText: true,
      decoration: InputDecoration(
        hintText: "Introduce el Usuario",
        contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(45.0))
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
//          var codigo = await validateUser();
          //print(codigo);
//          if( codigo == 200 ){
//            Navigator.push(context, MaterialPageRoute(builder:(context)=>Dashboard()));
            Navigator.pushReplacementNamed(context, "/dash");
//          }else{
//            showDialog(
//                context: context,
//                builder: (BuildContext context){
//                  return AlertDialog(
//                    title: Text("Mensaje de la APP"),
//                    content: Text("Error al Autenticarse"),
//                    actions: <Widget>[
//                      new FlatButton(
//                        child: Text("Cerrar"),
//                        onPressed: (){
//                          Navigator.of(context).pop();
//                        },
//                      )
//                    ],
//                  );
//                }
//            );
//          }
        },
        padding: EdgeInsets.all(12),
        color: Colors.lightBlue,
        child: Text('Entrar', style: TextStyle(color: Colors.white)),
      ),
    );

    final recordarInicioSesionTXT = Text(
      "Recordar inicio de sesión",
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 15.0,
        color: Color.fromARGB(255, 33, 37, 41),
      ),
    );

    final chkbxInicioSesion = Checkbox(
      value: recordarLogin,
      onChanged: (bool resp){
        setState(() {
          recordarLogin = resp;
        });
      },
      activeColor: Color.fromARGB(255, 33, 37, 41),
    );

    return MaterialApp(

      home:  Scaffold(
//        appBar: AppBar(
//          title: Text("Log-in"),
//          backgroundColor: Colors.lightGreen,
//        ),
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.only(left: 24.0, right: 24.0),
            children: <Widget>[
              logo,
              SizedBox(height: 30),
              txtUser,
              SizedBox(height: 30),
              txtPwd,
              SizedBox(height: 30),
              new Row(
                children: <Widget>[
                  chkbxInicioSesion,
                  recordarInicioSesionTXT
                ],
              ),
              SizedBox(height: 15.0),
              loginButton
            ],
          ),
        ),
      ),
    );
  }

}