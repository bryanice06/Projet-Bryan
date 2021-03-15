import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:no_name/Create/CreatePage.dart';
import 'package:no_name/HomePage/HomePage.dart';
import 'package:no_name/Profile/ProfilPage.dart';
import 'package:ss_bottom_navbar/ss_bottom_navbar.dart';
import 'package:flutter/cupertino.dart';

class Core extends StatefulWidget {

  @override
  _CoreState createState() => _CoreState();
}
class Style extends StyleHook {
  @override
  double get activeIconSize => 60;

  @override
  double get activeIconMargin => 10;

  @override
  double get iconSize => 40;

  @override
  TextStyle textStyle(Color color) {
    return TextStyle(color: Color(0xfffdbe00));
  }
}
class _CoreState extends State<Core> {
  int _state = 0;
  bool _isVisible = true;
  final items = [

    SSBottomNavItem(text: 'Home', iconData: Icons.emoji_events),
    SSBottomNavItem(text: 'Add', iconData: Icons.add_circle_outline_outlined),
    SSBottomNavItem(text: 'Profil', iconData: Icons.person_pin),
  ];

  @override
  void initState() {
    _state = 0;
    super.initState();
  }

 // List<Widget> _page = [
  /// style NavBAR


  List<StatefulWidget> _widgetOptions = <StatefulWidget> [
    HomePage(),
    CreatePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
        return Scaffold(
          // appBar: AppBar(
          //   title: Text('AREA', textAlign: TextAlign.center),
          // ),
          body: IndexedStack(
            index: _state,
            children: _widgetOptions,
          ),
          bottomNavigationBar: StyleProvider(
              style: Style(),
              child: ConvexAppBar(
                height: 50,
                curveSize: 110,
                activeColor: Colors.white,
                color: Colors.white,
                items: [
                  TabItem(icon: Icons.emoji_events, title: 'Card'),
                  TabItem(icon: Icons.add_circle_outline_outlined, title: 'Add'),
                  TabItem(icon: Icons.person_pin, title: 'Profile'),
                ],
                initialActiveIndex: 0,//optional, default as 0
                backgroundColor:  Colors.purple[700],
                onTap: (index) {
                  setState(() {
    _state = index;
                  });
                },
              )
          )
        );
  }



}


