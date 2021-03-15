import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_name/Create/Imgure/ImgurePageAction.dart';
import 'package:no_name/Create/Pollution/PollutionPage.dart';
import 'package:no_name/Create/Film/FilmPage.dart';
import 'package:no_name/Create/Riot/RiotPage.dart';

import 'Bourse/BoursePage.dart';
import 'Imgure/auth_imgure.dart';
import 'Meteo/MeteoPage.dart';
import 'Nasa/NasaPage.dart';

class ActionsCard {
  ActionsCard(this.name, this.Action, this.ActionInfo);

  String name;
  String Action;
  String ActionInfo;
}

class ChooseService extends StatefulWidget {
  @override
  _ChooseServiceState createState() => _ChooseServiceState();
}

class _ChooseServiceState extends State<ChooseService> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Choose your service !"),);
  }
}

class ActionPage extends StatefulWidget {
  @override
  _ActionPageState createState() => _ActionPageState();
}

class _ActionPageState extends State<ActionPage> {
  String _serviceMeteo = "Meteo";
  String _serviceBourse = "Bourse";
  String _serviceImgure = "Imgur";
  String _servicePollution = "Pollution";
  String _serviceFilm = "Film";
  String _serviceNasa = "Nasa";
  String _serviceRiot = "Riot";
  String notDefined = "NotDefined";
  TextEditingController editingController = TextEditingController();
  String _myService = "NotDefined";
  int _value = 0;
  List<StatefulWidget> _widgetOptions = <StatefulWidget> [
    ChooseService(),
    MeteoPage(),
    BoursePage(),
    WebViewContainer('https://api.imgur.com/oauth2/authorize?client_id=', '2342fecd4c376ad', "token", "action"),
    PollutionPage(),
    FilmPage(),
    NasaPage(),
    RiotPage(),
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(

      title: new Theme(
      child: new DropdownButton<String>(
        value: _myService,
        style: TextStyle(color: Colors.white),
        underline: Container(
          height: 2,
          color: Colors.white,
        ),
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        items: <DropdownMenuItem<String>>[
          new DropdownMenuItem(
            child: new Text(_serviceMeteo),
            value: _serviceMeteo,
          ),
          new DropdownMenuItem(
            child: new Text(_serviceBourse),
            value: _serviceBourse,
          ),
          new DropdownMenuItem(
            child: new Text(_serviceImgure),
            value: _serviceImgure,
          ),
          new DropdownMenuItem(
            child: new Text(_servicePollution),
            value: _servicePollution,
          ),
          new DropdownMenuItem(
            child: new Text(_serviceFilm),
            value: _serviceFilm,
          ),
          new DropdownMenuItem(
            child: new Text(_serviceNasa),
            value: _serviceNasa,
          ),
          new DropdownMenuItem(
            child: new Text(_serviceRiot),
            value: _serviceRiot,
          ),
          new DropdownMenuItem(
            child: new Text(notDefined),
            value: notDefined,
          ),
        ],
        onChanged: (String value) {
          setState(() {
            if (value == _serviceMeteo) {
              _value = 1;
              _myService  = value;
            }
            if (value == _serviceBourse){
              _value = 2;
              _myService  = value;
            }
            if (value == _serviceImgure){
              _value = 3;
              _myService  = value;
            }
            if (value == _servicePollution){
              _value = 4;
              _myService  = value;
            }
            if (value == _serviceFilm){
              _value = 5;
              _myService  = value;
            }
            if (value == _serviceNasa){
              _value = 6;
              _myService  = value;
            }
            if (value == _serviceRiot){
              _value = 7;
              _myService  = value;
            }
            if (value == notDefined){
              _value = 0;
              _myService  = value;
            }
          });
        },

    ),
    data: new ThemeData.dark(),
    ),
      ),
      body: _widgetOptions[_value],

    );
  }

}