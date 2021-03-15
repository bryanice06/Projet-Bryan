

import 'package:flutter/cupertino.dart';

class TriggerAction {
  TriggerAction({this.type, this.email, this.password, this.action});
  String type;
  String email;
  String password;
  String action;
}

class TriggerReaction {
  TriggerReaction({this.type, this.email, this.password, this.reaction});
  String type;
  String email;
  String password;
  String reaction;

}

class DataCreateCard {
  DataCreateCard({this.title, this.serviceAction, this.serviceReaction});
  String title;
  TriggerAction serviceAction;
  TriggerReaction serviceReaction;
}