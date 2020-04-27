import 'package:flutter/material.dart';
import 'package:letsgo/tools/app_tools.dart';
import 'package:letsgo/userScreens/signup.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();

  final scaffoldKey = new GlobalKey<ScaffoldState>();
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
verifyLoggin() {
    if(email.text==""){
      showSnackBar ("Please Enter your Email", scaffoldKey);
      return;
    }
    if(password.text==""){
      showSnackBar("Please emter your Password", scaffoldKey);
      return;
    }

    displayProgressDialog(context );

}


}
