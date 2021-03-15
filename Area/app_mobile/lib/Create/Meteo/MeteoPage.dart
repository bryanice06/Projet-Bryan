import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ActionPage.dart';
import '../CreatePage.dart';

class MeteoPage extends StatefulWidget {
  @override
  _MeteoPageState createState() => _MeteoPageState();
}

class _MeteoPageState extends State<MeteoPage> {

  String action1 = "When city below a temperature";
  String action2 = "When weather of a chosen city";
  String action3 = "When city above a temperature";
  String notDefined = "Not defined";
  String rain = "Rain";
  String cloud = "Cloud";
  String clear = "Clear";
  String _myAction;
  String _value = "Not defined";
  String _valueMeteo = "Not defined";
  final ActionsCard _actionsCard = ActionsCard("Weather", "action", "");
  final txtcity = TextEditingController();
  final txttemperature = TextEditingController();
  final txtcitys = TextEditingController();
  final txttemperatures = TextEditingController();
  final txtcity2 = TextEditingController();
  String dropdownValue = "Not defined";
  String dropdownMeteo = "Not defined";

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    txtcity.dispose();
    txttemperature.dispose();
    txtcitys.dispose();
    txttemperatures.dispose();
    txtcity2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Column(
      children: [
        dropdownAction(),
        parseAction(),

      ],
    )));
  }
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
      items: <String>[action1, action2, action3, notDefined]
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
      return verifTemperature();
    }
    if (_value == action2) {
      _actionsCard.Action = "action2";
      return typeOfTemperature();
    }
    if (_value == action3) {
      _actionsCard.Action = "action3";
      return verifTemperatures();
    }
    if (_value == notDefined)
      return selectAction();
  }
  Widget selectAction() {
    return Text("Select your action");
  }



  Widget typeOfTemperature() {
    return Column(
      children: [
        TextField(
          controller: txtcity,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'city',
          ),
        ),
        dropdownTypemeteo(),
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
              _actionsCard.ActionInfo = txtcity.text + "/" + _valueMeteo;
              Navigator.pop(
                context, _actionsCard
              );
            },
          ),
        ),
      ],
    );
  }
  Widget verifTemperature() {
    return Column(
      children: [
        TextField(
          controller: txtcity,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'city',
          ),
        ),
        TextField(
          controller: txttemperature,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Temperature',
          ),
        ),
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
              _actionsCard.ActionInfo = txtcity.text + "/" + txttemperature.text;
              Navigator.pop(
                context, _actionsCard
              );
            },
          ),
        ),
      ],
    );
  }
  Widget verifTemperatures() {
    return Column(
      children: [
        TextField(
          controller: txtcitys,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'city',
          ),
        ),
        TextField(
          controller: txttemperatures,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Temperature',
          ),
        ),
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
              _actionsCard.ActionInfo = txtcitys.text + "/" + txttemperatures.text;
              Navigator.pop(
                  context, _actionsCard
              );
            },
          ),
        ),
      ],
    );
  }
  Widget dropdownTypemeteo() {
    return DropdownButton<String>(
      value: dropdownMeteo,
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
          _valueMeteo = newValue;
          dropdownMeteo = _valueMeteo;
        });
      },
      items: <String>[rain, cloud, clear, notDefined]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
