import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ActionPage.dart';
import '../CreatePage.dart';

class BoursePage extends StatefulWidget {
  @override
  _BoursePageState createState() => _BoursePageState();
}

class _BoursePageState extends State<BoursePage> {
  String action1 = "When one currency is exceeded by another";
  String action2 = "When a currency exceedes the dollar";
  String notDefined = "Not defined";
  String euro = "EUR";
  String yen = "JPY";
  String dollar = "USD";
  String livre = "GBP";
  String franc = "CHF";
  String quatar = "QAR";
  String sos = "SOS";
  String fok = "FOK";
  String gel = "GEL";
  String top = "TOP";
  String _myAction;
  String _value = "Not defined";
  String _money1 = "Not defined";
  String _money2 = "Not defined";
  String _money = "Not defined";
  String bourse1;
  String bourse2;
  final ActionsCard _actionsCard = ActionsCard("CurrencyConverter", "action", "");
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Column(
      children: [
        dropdownAction(),
        parseAction(),

      ],
    )));
  }
  String dropdownMoney = "Not defined";
  String dropdownMoney1 = "Not defined";
  String dropdownMoney2 = "Not defined";
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
      return comparemoney();
    }
    if (_value == action2) {
      _actionsCard.Action = "action2";
      return comparedollar();
    }
  }
  Widget selectAction() {
    return Text("Select your action");
  }
  Widget comparemoney() {
    return Column(
      children: [
        dropdownTypemoney1(),
        Text("VS"),
        dropdownTypemoney2(),
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
              _actionsCard.ActionInfo = _money1 + "/" + _money2;
              Navigator.pop(
                  context, _actionsCard
              );
            },
          ),
        ),
      ],
    );
  }

  Widget dropdownTypemoney1() {
    return DropdownButton<String>(
      value: dropdownMoney1,
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
          _money1 = newValue;
          dropdownMoney1 = _money1;
        });
      },
      items: <String>[euro, yen, sos, dollar, livre, franc, quatar, fok, gel, top, notDefined]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget dropdownTypemoney2() {
    return DropdownButton<String>(
      value: dropdownMoney2,
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
          _money2 = newValue;
          dropdownMoney2 = _money2;
        });
      },
      items: <String>[euro, yen, sos, dollar, livre, franc, quatar, fok, gel, top, notDefined]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget comparedollar() {
    return Column(
      children: [
        dropdowncomparedollar(),
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
              _actionsCard.ActionInfo = _money;
              Navigator.pop(
                  context, _actionsCard
              );
            },
          ),
        ),
      ],
    );
  }
  Widget dropdowncomparedollar() {
    return DropdownButton<String>(
      value: dropdownMoney,
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
          _money = newValue;
          dropdownMoney = _money;
        });
      },
      items: <String>[euro, yen, sos, livre, franc, quatar, fok, gel, top, notDefined]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
