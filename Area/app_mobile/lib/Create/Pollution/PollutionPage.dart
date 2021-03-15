import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ActionPage.dart';
import '../CreatePage.dart';

class PollutionPage extends StatefulWidget {
  @override
  _PollutionPageState createState() => _PollutionPageState();
}

class _PollutionPageState extends State<PollutionPage> {
  String action1 = "When a city exceeds a pollution rate (AQI)";
  String action2 = "When a city exceeds the pollution rate of another city";
  String action3 = "When a city exceeds a dust rate (PM10)";
  String notDefined = "Not defined";
  String _myAction;
  String _value = "Not defined";
  final ActionsCard _actionsCard = ActionsCard("Pollution", "action", "");
  final txtville = TextEditingController();
  final txttauxpollution = TextEditingController();
  final txtville2 = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    txtville.dispose();
    txttauxpollution.dispose();
    txtville2.dispose();
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
      return getpollutionville();
    }
    if (_value == action2) {
      _actionsCard.Action = "action2";
      return comparevillepollution();
    }
    if (_value == action3) {
      _actionsCard.Action = "action3";
      return getpollutionvillepm10();
    }
  }
  Widget selectAction() {
    return Text("Select your action");
  }
  Widget getpollutionville() {
    return Column(
      children: [
        TextField(
          controller: txtville,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Ville',
          ),
        ),
        TextField(
          controller: txttauxpollution,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Taux Pollution AQI',
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
              _actionsCard.ActionInfo = txtville.text + "/" + txttauxpollution.text;
              Navigator.pop(
                context, _actionsCard
              );
            },
          ),
        ),
      ],
    );
  }
  Widget getpollutionvillepm10() {
    return Column(
      children: [
        TextField(
          controller: txtville,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Ville',
          ),
        ),
        TextField(
          controller: txttauxpollution,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Taux Pollution PM10',
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
              _actionsCard.ActionInfo = txtville.text + "/" + txttauxpollution.text;
              Navigator.pop(
                  context, _actionsCard
              );
            },
          ),
        ),
      ],
    );
  }
  Widget comparevillepollution() {
    return Column(
      children: [
        TextField(
          controller: txtville,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Ville',
          ),
        ),
        TextField(
          controller: txtville2,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Ville',
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
              _actionsCard.ActionInfo = txtville.text + "/" + txtville2.text;
              Navigator.pop(
                  context, _actionsCard
              );
            },
          ),
        ),
      ],
    );
  }
}
