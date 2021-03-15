import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:no_name/Model/User.dart';
import '../Core.dart';
import 'package:shared_preferences/shared_preferences.dart';

const users = const {
  'admin@admin.com': 'admin',
};

class Login extends StatelessWidget {
  String myService;
  Duration get loginTime => Duration(milliseconds: 2250);
  User user;

  Map<String, dynamic> values = {
    'email': 'null',
    'password': 'null',
    'username': 'null',

  };

  Future<String> _authUser(LoginData data) {
    print('ca passe');
    print('ca passe');
    setValues(data.name, data.password);
    print('ca passe');

    return Future.delayed(loginTime).then((_) {

      if (!users.containsKey(data.name))
        return 'Username not exists';
      if (users[data.name] != data.password)
        return 'Password does not match';

      return null;

    });
  }
  void setValues(String email, String password) {
    print("ca passe");
    values['email'] = email;
    values['password'] = password;
    print('Name: ${values['email']}, Password: ${values['password']}');
    print('Name: ${email}, Password: ${password}');
    SharedPreferences.setMockInitialValues(values);

    print("ca passe");
  }

  Future<String> _recoverPassword(String name) {
    print('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name))
        return 'Username not exists';
      return null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlutterLogin(
      title: 'Connection',
      onLogin: _authUser,
      onSignup: _authUser,
      onSubmitAnimationCompleted: () {
        print("ici" + values['email']);
        print(myService);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Core()
          ),
        );

      },
      onRecoverPassword: _recoverPassword,
    );
  }
}