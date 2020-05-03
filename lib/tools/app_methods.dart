import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

abstract class AppMethods{
Future<String> createUserAccount({String fullname, String phone, String email, String password});
Future<String> logginUser({ String email, String password});
Future<bool>loggedOut();
Future<DocumentSnapshot> getUserInfo(String userid);


}