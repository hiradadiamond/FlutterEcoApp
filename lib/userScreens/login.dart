import 'package:flutter/material.dart';
import 'package:letsgo/tools/app_data.dart';
import 'package:letsgo/tools/app_methods.dart';
import 'package:letsgo/tools/app_tools.dart';
import 'package:letsgo/tools/firebase_methods.dart';
import 'package:letsgo/userScreens/signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  AppMethods appMethod= new FirebaseMethods();
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context= context;
    return Scaffold(
        key: scaffoldKey,
        backgroundColor: Theme
            .of(context)
            .primaryColor,
        appBar: new AppBar(
          centerTitle: false,
          title: new Text("Login"),
          elevation: 0.0,
        ),
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[

              new SizedBox(
                height: 30.0,
              ),
              appTextField(
                  isPassword: false,
                  sidPadding: 18.0,
                  textHint: "Email",
                  textIcon: Icons.email,
                  controller: email

              ),

              new SizedBox(
                height: 30.0,
              ),
              appTextField(
                  isPassword: true,
                  sidPadding: 18.0,
                  textHint: "Password",
                  textIcon: Icons.lock,
                  controller: password

              ),
              appButton(btnTxt: "Login ", onClick: verifyLoggin,
                  btnPadding: 30.0,
                  btnColor: Theme
                      .of(context)
                      .primaryColor),
              new GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder: (context)=> new SignUp()));
                },
                child: new Text("Not Registered? Sign Up Here",
                  style: new TextStyle(color: Colors.white),),
              )

            ],
          ),
        )
    );
  }
  verifyLoggin() async {
    if (email.text == "") {
      showSnackBar("Email cannot be empty", scaffoldKey);
      return;
    }

    if (password.text == "") {
      showSnackBar("Password cannot be empty", scaffoldKey);
      return;
    }

    displayProgressDialog(context);
    String response = await appMethod.logginUser(
        email: email.text.toLowerCase(), password: password.text.toLowerCase());
    if (response == successful) {
      closeProgressDialog(context);
      Navigator.of(context).pop(true);
    } else {
      closeProgressDialog(context);
      showSnackBar(response, scaffoldKey);
    }
  }
}