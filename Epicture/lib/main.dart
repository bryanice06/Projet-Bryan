import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:epicture/Auth/Auth.dart';

import 'Pages/profil.dart';
import 'Pages/add.dart';
import 'Pages/home.dart';
import 'Pages/notif.dart';
import 'Pages/search.dart';

void main() => runApp(MaterialApp(home: WebViewContainer('https://api.imgur.com/oauth2/authorize?client_id=', '2342fecd4c376ad', "token")));

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;
  int _selectedIndex = 0;
  GlobalKey _bottomNavigationKey = GlobalKey();
  static List<Color> _colorOptions = <Color>[
    Colors.blueAccent,
    Colors.redAccent,
    Colors.yellowAccent,
    Colors.greenAccent,
    Colors.pinkAccent
  ];
  List<StatefulWidget> _widgetOptions = <StatefulWidget> [
    Home(),
    Search(),
    Add(),
    Notif(),
    Profil()
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: _bottomNavigationKey,
          index: 0,
          height: 50.0,
          items: <Widget>[
            Icon(Icons.add, size: 30),
            Icon(Icons.list, size: 30),
            Icon(Icons.arrow_drop_down_circle, size: 50),
            Icon(Icons.favorite_border, size: 30),
            Icon(Icons.perm_identity, size: 30),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: _colorOptions.elementAt(_page),
          animationCurve: Curves.easeInOut,
          animationDuration: Duration(milliseconds: 600),
          onTap: (index) {
            setState(() {
              _page = index;
            });
          },
        ),
        appBar: AppBar(
            title: Stack(
              children: <Widget>[
                Container(
                  width: 500,
                  constraints: BoxConstraints.expand(
                    height: Theme.of(context).textTheme.headline4.fontSize * 1.2 + 75.0 ,
                  ),
                  padding: const EdgeInsets.all(8.0),
                  color: Colors.white,
                  alignment: Alignment.topCenter,
                  transform: Matrix4.rotationZ(0.1 ),
                ),
                Text('\nEpicture',
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: _colorOptions[_page])),
              ]
            ),
            backgroundColor: _colorOptions[_page],
            automaticallyImplyLeading: true,
        ),
        body: Container(
          color: _colorOptions.elementAt(_page),
          child: Container(
            height: 900,
            width: 500,
            child:
              _widgetOptions.elementAt(_page),

          ),
        )
    );
  }
}