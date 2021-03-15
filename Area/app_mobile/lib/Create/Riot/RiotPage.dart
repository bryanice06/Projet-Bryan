import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ActionPage.dart';
import '../CreatePage.dart';

class RiotPage extends StatefulWidget {
  @override
  _RiotPageState createState() => _RiotPageState();
}

class _RiotPageState extends State<RiotPage> {

  String action1 = "When a player gives LOL passes rank 1";
  String action2 = "When a player gives TFT passes rank 1";
  String notDefined = "Not defined";
  String _value = "Not defined";
  final ActionsCard _actionsCard = ActionsCard("RiotGame", "action", "");
  final txtpseudo = TextEditingController();
  String dropdownValue = "Not defined";

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    txtpseudo.dispose();
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
      return verifRank1lol();
    }
    if (_value == action2) {
      _actionsCard.Action = "action2";
      return verifRank1tft();
    }
    if (_value == notDefined)
      return selectAction();
  }
  Widget selectAction() {
    return Text("Select your action");
  }

  Widget verifRank1lol() {
    return Column(
      children: [
        TextField(
          controller: txtpseudo,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Pseudo',
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
              _actionsCard.ActionInfo = txtpseudo.text;
              Navigator.pop(
                  context, _actionsCard
              );
            },
          ),
        ),
      ],
    );
  }
  Widget verifRank1tft() {
    return Column(
      children: [
        TextField(
          controller: txtpseudo,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Pseudo',
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
              _actionsCard.ActionInfo = txtpseudo.text;
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
