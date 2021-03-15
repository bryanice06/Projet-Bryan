import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:no_name/Services/Auth/RegisterData.dart';

import '../Core.dart';
import 'Widget/bezierContainer.dart';
import 'loginPage.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool value;
  TextEditingController editingControlleremail = TextEditingController();
  TextEditingController editingControllerusername = TextEditingController();
  TextEditingController editingControllerpassword = TextEditingController();
  String email;
  String password;
  String username;
  void initState() {
    super.initState();
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }
  Widget emailForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          setState(() {
            email = value;

          });
        },
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: 15),
        controller: editingControlleremail,
        decoration: InputDecoration(
          fillColor: Colors.black,
          labelText: "Email",
        ),
      ),
    );
  }
  Widget usernameForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          setState(() {
            username = value;

          });
        },
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: 15),
        controller: editingControllerusername,
        decoration: InputDecoration(
          fillColor: Colors.black38,
          labelText: "User name",
        ),
      ),
    );
  }
  Widget passwordForm() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onChanged: (value) {
          setState(() {
            password = value;

          });
        },
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: 15),
        controller: editingControllerpassword,
        decoration: InputDecoration(
          fillColor: Colors.black,
          labelText: "Password",
        ),
      ),
    );
  }

  Widget _submitButton() {
    return new InkWell(
    onTap: () {
      print('email :' + email);
      print(password);
      print(username);
      setState(() {
        Register().registerUser(username, email, password)
            .then((bool a) => (setState(() => this.value = a)));
      });
      if (value != null) {
        print(value);
        if (value) {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Core()
            ),
          );
        }
      }
      // If the form is valid, display a Snackbar.
    },
    child: new Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade200,
                offset: Offset(2, 4),
                blurRadius: 5,
                spreadRadius: 2)
          ],
          gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Colors.purple,Colors.deepPurple])),
      child: Text(
        'Register Now',
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    )
    );
  }

  Widget _loginAccountLabel() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginPage()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.all(15),
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Already have an account ?',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Login',
              style: TextStyle(
                  color: Colors.purpleAccent,
                  fontSize: 13,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
          text: 'A',
          style: GoogleFonts.portLligatSans(
            textStyle: Theme.of(context).textTheme.display1,
            fontSize: 30,
            fontWeight: FontWeight.w700,
            color: Colors.purple,
          ),
          children: [
            TextSpan(
              text: 're',
              style: TextStyle(color: Colors.black, fontSize: 30),
            ),
            TextSpan(
              text: 'a',
              style: TextStyle(color: Colors.purpleAccent, fontSize: 30),
            ),
          ]),
    );
  }

  Widget _emailPasswordWidget() {
    return Column(
      children: <Widget>[
        usernameForm(),
        emailForm(),
        passwordForm()

      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        height: height,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -MediaQuery.of(context).size.height * .15,
              right: -MediaQuery.of(context).size.width * .4,
              child: BezierContainer(),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: height * .2),
                    _title(),
                    SizedBox(
                      height: 50,
                    ),
                    _emailPasswordWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    _submitButton(),
                    SizedBox(height: height * .0005),
                    _loginAccountLabel(),
                  ],
                ),
              ),
            ),
            Positioned(top: 40, left: 0, child: _backButton()),
          ],
        ),
      ),
    );
  }
}
