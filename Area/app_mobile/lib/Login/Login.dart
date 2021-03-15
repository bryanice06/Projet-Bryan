import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import '../Core.dart';

const users = const {
  'admin@admin.com': 'admin',
};
class ServiceValue {
  ServiceValue({this.isGood});
  bool isGood;
  String email;
  String password;
}
class LoginToServer extends StatelessWidget {
  String myService;
  ServiceValue value;
  Duration get loginTime => Duration(milliseconds: 2250);
  LoginToServer({this.myService, this.value});

  Future<String> _authLoginUser(LoginData data) {

    print('Name: ${data.name}, Password: ${data.password}');
    value.email = data.name;
    value.password = data.password;
    print('Name: ${value.email}, Password: ${value.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name))
        return 'Username not exists';
      if (users[data.name] != data.password)
        return 'Password does not match';
      return null;
    });
  }
  Future<String> _authRegisterUser(LoginData data) {

    print('Name: ${data.name}, Password: ${data.password}');
    value.email = data.name;
    value.password = data.password;
    print('Name: ${value.email}, Password: ${value.password}');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(data.name))
        return 'Username not exists';
      if (users[data.name] != data.password)
        return 'Password does not match';
      return null;
    });
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
    return Column(
      children: [
        Text('ici'),
        FlutterLogin(
          title: 'Connection',
          titleTag: 'lol',
          onLogin: _authLoginUser,
          onSignup: _authRegisterUser,
          onSubmitAnimationCompleted: () {

            print(myService);
            value.isGood = true;
            Navigator.pop(context, value);

          },
          onRecoverPassword: _recoverPassword,
        )
      ],
    );

  }
}