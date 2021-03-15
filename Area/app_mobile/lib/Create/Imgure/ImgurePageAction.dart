import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../ActionPage.dart';
import '../CreatePage.dart';

class ImgurePageAction extends StatefulWidget {
  var token;
  ImgurePageAction({this.token});
  @override
  _ImgurePageActionState createState() => _ImgurePageActionState(token: this.token);
}


class _ImgurePageActionState extends State<ImgurePageAction> {
  var token;
  _ImgurePageActionState({this.token});
  var data;


  String action1 = "When a photo exceeds a certain number of views";
  String notDefined = "Not defined";
  String _myAction;
  String _value = "Not defined";
  final ActionsCard _actionsCard = ActionsCard("Imgur", "action", "");
  final nbrview = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    nbrview.dispose();
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
      items: <String>[action1, notDefined]
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
      return nombre_vue_img();
    }
  }
  Widget selectAction() {
    return Text("Select your action");
  }
  Widget nombre_vue_img() {
    return Column(
      children: [
        TextField(
          controller: nbrview,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Value',
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
              _actionsCard.ActionInfo = token + '/' + nbrview.text;
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
