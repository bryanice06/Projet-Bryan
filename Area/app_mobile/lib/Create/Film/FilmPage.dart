import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../ActionPage.dart';
import '../CreatePage.dart';

class FilmPage extends StatefulWidget {
  @override
  _FilmPageState createState() => _FilmPageState();
}

class _FilmPageState extends State<FilmPage> {
  String action1 = "When a movie comes out";
  String action2 = "When a movie genre comes out";
  String action = "Action";
  String adventure = "Adventure";
  String animation = "Animation";
  String comedy = "Comedy";
  String fantasy = "Fantasy";
  String thriller = "Thriller";
  String science = "Science Fiction";
  String horror = "Horror";
  String notDefined = "Not defined";
  String _myAction;
  String _value = "Not defined";
  String dropdownGenre = "Not defined";
  String _value1 = "Not defined";
  String id_genre = "0";
  final ActionsCard _actionsCard = ActionsCard("Cinema", "action", "info==");
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
      return filmnow();
    }
    if (_value == action2) {
      _actionsCard.Action = "action2";
      return filmgenre();
    }
  }
  Widget selectAction() {
    return Text("Select your action");
  }
  Widget filmnow() {
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
                  context, _actionsCard
              );
            },
          ),
        ),
      ],
    );
  }
  Widget filmgenre() {
    return Column(
      children: [
        dropdowngenre(),
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
              _actionsCard.ActionInfo = id_genre;
              Navigator.pop(
                  context, _actionsCard
              );
            },
          ),
        ),
      ],
    );
  }
  Widget dropdowngenre() {
    return DropdownButton<String>(
      value: dropdownGenre,
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
          if (newValue == action) {
            id_genre = "28";
          }
          if (newValue == adventure){
            id_genre = "12";
          }
          if (newValue == animation){
            id_genre = "16";
          }
          if (newValue == comedy){
            id_genre = "35";
          }
          if (newValue == fantasy){
            id_genre = "14";
          }
          if (newValue == thriller){
            id_genre = "53";
          }
          if (newValue == science){
            id_genre = "878";
          }
          if (newValue == horror){
            id_genre = "27";
          }
          _value1 = newValue;
          dropdownGenre = _value1;
        });
      },
      items: <String>[action, adventure, animation, comedy, fantasy, thriller, science, horror, notDefined]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
