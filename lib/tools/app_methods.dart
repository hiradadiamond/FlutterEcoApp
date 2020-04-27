import 'dart:async';

abstract class AppMethods{
Future<bool> CreateUserAccount({String fullname, String phone, String email, String password});
Future<bool> LogginUser({ String email, String password});


}