import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../CreatePage.dart';
import '../ReactionPage.dart';

class ImgurePageReaction extends StatefulWidget {
  var token;
  ImgurePageReaction({this.token});
  @override
  _ImgurePageReactionState createState() => _ImgurePageReactionState(token: this.token);
}


class _ImgurePageReactionState extends State<ImgurePageReaction> {

  var token;
  _ImgurePageReactionState({this.token});

  Future<http.Response> getAccountBase() async {
    var context = await SharedPreferences.getInstance();
    Future<http.Response> response = http.get(
        "https://api.imgur.com/3/account/" + context.getString("user_account_name"),
        headers: {
          "Authorization": "Client-ID " + context.getString("account_id")
        }
    );
    return response;
  }
  var data;
  final ReactionsCard _reactionsCard = ReactionsCard("Imgur", "reaction", "");

  String reaction1 = "Favorite a random photo";
  String reaction2 = "Like a random photo";
  String reaction3 = "Dislike a random photo";
  String notDefined = "Not defined";
  String _value = "Not defined";
  @override
  Widget build(BuildContext context) {
    return Container(child: Center(child: Column(
      children: [
        dropdownReaction(),
        parseReaction(),

      ],
    )));
  }
  String dropdownValue = "Not defined";
  Widget dropdownReaction() {
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
      items: <String>[reaction1, reaction2, reaction3, notDefined]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
  Widget parseReaction() {
    if (_value == notDefined) {
      return selectReaction();
    }
    if (_value == reaction1) {
      _reactionsCard.Reaction = "reaction1";
      return fav_img();
    }
    if (_value == reaction2) {
      _reactionsCard.Reaction = "reaction2";

      return like_img();
    }
    if (_value == reaction3) {
      _reactionsCard.Reaction = "reaction3";
      return dislike_img();
    }
  }
  Widget selectReaction() {
    return Text("Select your reaction");
  }
  Widget fav_img() {
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
              _reactionsCard.ReactionInfo = token;
              Navigator.pop(
                  context, _reactionsCard
              );
            },
          ),
        ),
      ],
    );
  }
  Widget like_img() {
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
              _reactionsCard.ReactionInfo = token;
              Navigator.pop(
                  context, _reactionsCard
              );
            },
          ),
        ),
      ],
    );
  }
  Widget dislike_img() {
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
              _reactionsCard.ReactionInfo = token;
              Navigator.pop(
                  context, _reactionsCard
              );
            },
          ),
        ),
      ],
    );
  }
}
