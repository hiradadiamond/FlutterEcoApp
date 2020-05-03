import 'package:flutter/material.dart';
import 'package:letsgo/tools/app_data.dart';
import 'package:letsgo/tools/app_methods.dart';
import 'package:letsgo/tools/app_tools.dart';
import 'package:letsgo/tools/firebase_methods.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  TextEditingController fullname = new TextEditingController();
  TextEditingController phonenumber = new TextEditingController();
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  TextEditingController re_password = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext context;
  AppMethods appmethod = new FirebaseMethods();

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
          title: new Text("Sign Up"),
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
                  textHint: "Full Name",
                  textIcon: Icons.person,
                  controller: fullname

              ),
              new SizedBox(
                height: 30.0,
              ),
              appTextField(
                  isPassword: false,
                  sidPadding: 18.0,
                  textHint: "Phone Number",
                  textIcon: Icons.phone,
                  controller: phonenumber,
                  textType: TextInputType.number

              ),
              new SizedBox(
                height: 20.0,
              ),
              appTextField(
                  isPassword: false,
                  sidPadding: 18.0,
                  textHint: "Email Address",
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
              new SizedBox(
                height: 30.0,
              ),
              appTextField(
                  isPassword: true,
                  sidPadding: 18.0,
                  textHint: "Re-Password",
                  textIcon: Icons.lock,
                  controller: re_password

              ),
              appButton(btnTxt: "Create Account ", onClick: VerifyDetails,
                  btnPadding: 20.0,
                  btnColor: Theme
                      .of(context)
                      .primaryColor),


            ],
          ),
        )
    );
  }
  VerifyDetails() async {
    if(fullname.text==""){
      showSnackBar ("Fullname can not be empty", scaffoldKey);
      return;
    }
    if(phonenumber.text==""){
      showSnackBar("Please emter your Phone Number", scaffoldKey);
    }
    if(email.text==""){
      showSnackBar ("Please Enter your Email", scaffoldKey);
      return;
    }
    if(password.text==""){
      showSnackBar("Please emter your Password", scaffoldKey);
    }
    displayProgressDialog(context );

    String response = await appmethod. createUserAccount(
        fullname: fullname.text,
        phone: phonenumber.text,
        email: email.text.toLowerCase(),
        password: password.text.toLowerCase());
    if(response== successful){
      closeProgressDialog(context);
      Navigator.of(context).pop();
      Navigator.of(context).pop(true);
    }
    else
      {
        closeProgressDialog(context);
        showSnackBar(response, scaffoldKey);
      }

  }


}

