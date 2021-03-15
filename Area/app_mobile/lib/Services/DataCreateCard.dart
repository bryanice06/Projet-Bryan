import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:no_name/Create/CreatePage.dart';
import 'package:no_name/Model/Cards.dart';
import 'dart:convert' as convert;
import 'package:no_name/Model/User.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CardsData {

  Future<bool> getCreateData(Cards card) async {
    SharedPreferences email = await SharedPreferences.getInstance();
  print('email' + email.getString('email'));
  print("envoyer cards ==== " + card.ActionInfo);
    var response = await http.post(
      "https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/createcard",
      body:
      jsonEncode(<String, String>{
        "email": email.getString('email'),
        "name": card.name,
        "actionService": card.ServiceAction,
        "actioninfo": card.ActionInfo,
        "action": card.Action,
        "reaction": card.Reaction,
        "reactionService": card.ServiceReaction,
        "reactioninfo": card.ReactionInfo,
      }),
    );

    print("ca passe" + response.statusCode.toString());
    print("ca passe" + response.reasonPhrase);

    if (response.statusCode == 200) {
      return true;
    } else {
      return null;
    }
  }
  Future<CardsList> getCards() async {
    SharedPreferences email = await SharedPreferences.getInstance();
    print('email' + email.getString('email'));
    var response = await http.post(
      "https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/getcards",
        body:
        jsonEncode(<String, String>{
          "email": email.getString('email'),
      }),
    );
    print('status == ' + response.statusCode.toString());

    if (response.statusCode == 200) {
      var json = convert.jsonDecode(response.body);
      print("json === " + json.toString());
      return CardsList.fromJson(json);
    } else {
      return null;
    }
  }
  Future<void> ActiveCards(List<Cards> cards) async {
    SharedPreferences email = await SharedPreferences.getInstance();
    print('email' + email.getString('email'));

    cards.forEach((element) async {
      var response = await http.post(
        "https://xuzy1i1jal.execute-api.eu-west-3.amazonaws.com/prod/activecards",
        body:
        jsonEncode(<String, String>{
          "email": email.getString('email'),
          "cardname": element.name
        }),
      );
      print('status == ' + response.statusCode.toString());

      if (response.statusCode == 200) {
        print("isActive");
      } else {
        print("is not Active");
      }
    });

  }



}