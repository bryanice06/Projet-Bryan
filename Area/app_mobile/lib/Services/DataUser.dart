
import 'dart:convert' as convert;
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/User.dart';

class DataUser {

  Future<void> setUset(User) {

  }

  Future<User> getUser() async {
    print("json === ");
    SharedPreferences response = await SharedPreferences.getInstance();

    Map<String, dynamic> json = {
      'email': 'null',
      'password': 'null',
      'username': 'null',

    };
    json['email'] = response.getString('email');
    json['password'] = response.getString('password');
    json['username'] = response.getString('username');
    if (response != null) {
      return User.fromJson(json);
    } else {
      return null;
    }
  }
}