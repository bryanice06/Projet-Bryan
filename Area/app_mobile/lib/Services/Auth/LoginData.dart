import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:no_name/Model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';


Map<String, dynamic> values = {
  'email': 'null',
  'password': 'null',
  'username': 'null',

};

class Login {

  Future<bool> getLogin(email, password) async {
    var response = await http.get(
      "https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/login2?email="
          + email
          + 'password='
          + password,
    );
    print('status' + response.statusCode.toString());

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

