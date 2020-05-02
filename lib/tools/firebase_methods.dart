import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'app_methods.dart';
import 'app_data.dart';
import 'app_tools.dart';

class FirebaseMethods implements AppMethods {
  Firestore firestore = Firestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Future<String> createUserAccount(
      {String fullname, String phone, String email, String password}) async {
     FirebaseUser user;
    try {
      user = (await auth.createUserWithEmailAndPassword(
          email: email, password: password)).user;

      if (user != null) {
        await firestore.collection(userData).document(user.uid).setData({
          userId: user.uid,
          fullname: fullname,
          emailAddress: email,
          phonenumber: phone,
          Userpassword: password
        });

        writeDataLocally(key: userId, value: user.uid);
        writeDataLocally(key: fullname, value: fullname);
        writeDataLocally(key: emailAddress, value: emailAddress);
        writeDataLocally(key: Userpassword, value: Userpassword);

      }
    } on PlatformException catch (e) {
      print(e);
      return errorMSG(e.message);
    }
    return user == null ? errorMSG("Error") : successfulMSG();
  }

  @override
  Future<String>logginUser({String email, String password}) async {
    FirebaseUser user;
    try {
      user = await auth.signInWithEmailAndPassword(
          email: email, password: password) as FirebaseUser;
    } on PlatformException catch (e) {
      print(e);
      return errorMSG(e.details);
    }

    return user == null ? errorMSG("Error") : successfulMSG();
  }

  Future<bool> complete() async {
    return true;
  }

  Future<bool> notComplete() async {
    return false;
  }

  Future<String> errorMSG(String e) async {
    return e;
  }

  Future<String> successfulMSG() async {
    return successful;
  }
}
