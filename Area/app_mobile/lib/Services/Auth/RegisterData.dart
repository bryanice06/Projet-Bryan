import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:no_name/Model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register {
  Map<String, dynamic> values = {
    'email': 'null',
    'password': 'null',
    'username': 'null',

  };
  Future<bool> registerUser(String username, String email, String password) async {

    var response = await http.post(
        "https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/login2/",
      body:
        jsonEncode(<String, String>{
          "email": email,
          "password": password,
          "firstname": username

        }),
    );

    print("ca passe" + response.statusCode.toString());
    print("ca passe" + response.reasonPhrase);

    if (response.statusCode == 200) {
      values['email'] = email;
      values['password'] = password;
      print('Name: ${values['email']}, Password: ${values['password']}');
      print('Name: ${email}, Password: ${password}');
      SharedPreferences.setMockInitialValues(values);
      return true;
    } else {
      return null;
    }
  }
}