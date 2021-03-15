import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

const List account_json = [
  {"img": "assets/images/profile.jpg", "name": "theo jeanningros", "age": "20"}
];

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

   Color white = Colors.white;
   Color grey = Colors.grey;
   Color black = Colors.black;
   Color green = Colors.green;
   Color primary = Color(0xFFFD5C61);

// gradient
   Color yellow_one = Color(0xFFeec365);
   Color yellow_two = Color(0xFFde9024);
   Color primary_one = Color(0xFFfc3973);
   Color primary_two = Color(0xFFfd5f60);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.2),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        width: size.width,
        height: size.height * 0.60,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.purple],
        ),
            boxShadow: [

          BoxShadow(
            color: grey.withOpacity(0.1),
            spreadRadius: 10,
            blurRadius: 10,
          ),
        ]),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.deepPurple, Colors.purple],
                    ),
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(account_json[0]['img']),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                account_json[0]['name'] + ", " + account_json[0]['age'],
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: white),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

