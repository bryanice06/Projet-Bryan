import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:no_name/Create/ActionPage.dart';

import '../CreatePage.dart';

class NasaPage extends StatefulWidget {
  @override
  _NasaPageState createState() => _NasaPageState();
}

class _NasaPageState extends State<NasaPage> {
  String action1 = "When satelite photo is posted";
  String action2 = "When meteorite passes close to the earth";
  String notDefined = "Not defined";
  String _myAction;
  String _value = "Not defined";
  final ActionsCard _actionsCard = ActionsCard("Nasa", "action", "info==");
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Column(
      children: [
        dropdownAction(),
        parseAction(),
      ],
    )));
  }
  String dropdownValue = "Not defined";
  Widget dropdownAction() {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.deepPurpleAccent,
      ),
      onChanged: (String newValue) {
        setState(() {
          _value = newValue;
          dropdownValue = _value;
        });
      },
      items: <String>[action1, action2, notDefined]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
  Widget parseAction() {
    if (_value == notDefined)
      return selectAction();
    if (_value == action1) {
      _actionsCard.Action = "action1";
      return Nasanow();
    }
      if (_value == action2) {
        _actionsCard.Action = "action2";
        return Nasanow2();
    }
  }
  Widget selectAction() {
    return  Text("Select your action");
  }
  Widget Nasanow() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: FloatingActionButton(
            //heroTag: null, //Must be null to avoid hero animation errors
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            splashColor: Colors.purpleAccent,
            focusColor: Colors.deepPurple,
            hoverColor: Colors.purple,
            backgroundColor: Colors.deepPurple,
            onPressed: () async {
              Navigator.pop(
                context, _actionsCard,
              );
            },
          ),
        ),
      ],
    );
  }
  Widget Nasanow2() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(50.0),
          child: FloatingActionButton(
            //heroTag: null, //Must be null to avoid hero animation errors
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
            splashColor: Colors.purpleAccent,
            focusColor: Colors.deepPurple,
            hoverColor: Colors.purple,
            backgroundColor: Colors.deepPurple,
            onPressed: () async {
              Navigator.pop(
                context, _actionsCard,
              );
            },
          ),
        ),
      ],
    );
  }
}
