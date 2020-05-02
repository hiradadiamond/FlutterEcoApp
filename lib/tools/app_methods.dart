import 'dart:async';

abstract class AppMethods{
Future<String> createUserAccount({String fullname, String phone, String email, String password});
Future<String> logginUser({ String email, String password});


}