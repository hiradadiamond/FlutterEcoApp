import 'package:flutter/material.dart';
import 'package:letsgo/userScreens/progressDialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

Widget appTextField(
    {IconData textIcon,
    String textHint,
    bool isPassword,
    TextEditingController controller,
    double sidPadding, TextInputType textType,
    }) {
  sidPadding == null ? sidPadding = 0.0 : sidPadding;
  textHint == null ? textHint = "" : textHint;
  //textType== null? textType == TextInputType.text: textType;
  return Padding(
    padding: new EdgeInsets.only(left: sidPadding, right: sidPadding),
    child: new Container(
      decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.all(new Radius.circular(15.0))),
      child: new TextField(
        controller: controller,
        obscureText: isPassword == null ? false : isPassword,
        keyboardType: textType==null? TextInputType.text: textType ,
        decoration: new InputDecoration(
            border: InputBorder.none,
            hintText: textHint,
            prefixIcon:
                textIcon == null ? new Container() : new Icon(textIcon)),
        
      ),
    ),
  );
}

Widget appButton(
    { String btnTxt,
      double btnPadding,
      Color btnColor,
      VoidCallback onClick}) {
  btnTxt == null ? btnTxt = "App Button" : btnTxt;
  btnPadding == null ? btnPadding = 0.0 : btnPadding;
  btnColor == null ? btnColor = Colors.black : btnColor;

  return Padding (
    padding: new EdgeInsets.all(btnPadding),
    child: new RaisedButton(
      color: Colors.white,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.all(new Radius.circular(15.0))),
      onPressed: onClick,
      child: Container(
        height: 50.0,
        child: new Center(
          child: new Text(btnTxt,
              style: new TextStyle(color: btnColor, fontSize: 18.0)),
        ),
      ),
    ),
  );
}
showSnackBar(String message, final scaffoldKey) {
  scaffoldKey.currentState.showSnackBar(new SnackBar(
    backgroundColor: Colors.red[600],
    content:  Container(
      child: Text(
        message,
        style: new TextStyle(color: Colors.white),
      ),
    ),
  ));
}
 closeProgressDialog(BuildContext context){
  Navigator.of(context).pop();
 }

 displayProgressDialog(BuildContext context){
  Navigator.of(context).push(new PageRouteBuilder(opaque:false,
      pageBuilder: (BuildContext context, _, __){
    return new ProgressDialog();
      }));
 }

 writeDataLocally({String key, String value}) async{
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localdata= await saveLocal;
  localdata.setString(key, value);
 }
writeBoolDataLocally({String key, bool value}) async {
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localData = await saveLocal;
  localData.setBool(key, value);
}
getDataLocally({String key}) async{
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localdata= await saveLocal;
  return localdata.get(key);
}

getStringDataLocally({String key}) async{
   Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
   final SharedPreferences localdata= await saveLocal;
   return localdata.getString(key);
 }
getBoolDataLocally({String key}) async{
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localdata= await saveLocal;
  return localdata.getBool(key) == null ? false : localdata.getBool(key);
}

ClearDataLocally() async{
  Future<SharedPreferences> saveLocal = SharedPreferences.getInstance();
  final SharedPreferences localdata= await saveLocal;
  localdata.clear();

}

