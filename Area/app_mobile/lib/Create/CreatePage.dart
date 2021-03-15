import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:no_name/HomePage/HomePage.dart';
import 'package:no_name/Login/Login.dart';
import 'package:no_name/Model/Cards.dart';
import 'package:no_name/Model/User.dart';
import 'package:no_name/Model/Create.dart';
import 'package:no_name/Services/DataCreateCard.dart';
import 'package:no_name/Services/DataUser.dart';
import 'package:no_name/Model/Cards.dart';

import '../Core.dart';
import '../Login/V1.dart';
import 'ActionPage.dart';
import 'ReactionPage.dart';
import 'BlockActionCreate.dart';


class DataCard {
  DataCard(this.name, this.creator, this.status);

  String name;
  String creator;
  bool status;
}

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final DataCard data = DataCard("machin", "creator", true);
  DataCreateCard card;
  Color purple = Colors.deepPurple;
  List<String> logo = ["inst", "fb"];
  ServiceValue result = new ServiceValue(isGood: false);
  ServiceValue result2 = new ServiceValue(isGood: false);
  String _myServiceResult;
  String _myServiceResult2;
  String _myTriggeryResult;
  String _myActionyResult;
  ActionsCard _actionsCard = ActionsCard(null, null, null);
  ReactionsCard _reactionsCard = ReactionsCard(null, null, null);
  String res2;
  final formKey = new GlobalKey<FormState>();
  Cards _cards= new Cards(null, null, null, null, null, null, null);
  User user;

  _CreatePageState() {
    print("gang");
    DataUser().getUser().then((User a) => (setState(() => this.user = a)));
  }

  TextEditingController editingController = TextEditingController();
  String NameOfCard;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (this.user != null) {
      return Container(
          child: Stack(
              alignment: Alignment.bottomRight,
              children: [
                  Container(
                      child: LayoutBuilder(
                          builder: (BuildContext context, BoxConstraints viewportConstraints) {
                            return SingleChildScrollView(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minHeight: viewportConstraints.maxHeight,
                              ),
                              child: Center(
                                  child: Container(
                                      child: CoreCreate(context, size)))));
              })),
              Padding(
                padding: const EdgeInsets.all(16.0),
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
                    CardsData().getCreateData(_cards).then((value)  {
                      if (value == true) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Core()),
                        );
                      }
                    });

                  },
                ),
              ),
          ]));
    } else {
      return Container(child: Text('No data'));
    }
  }

  Widget CoreCreate(context, size) {
    return Column(
      children: <Widget>[
        //Text(this.user.email),
        SizedBox(height: 30),
        addServiceAction(context, size, "1", "Action"),
        SizedBox(height: 10),
        Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                gradient: LinearGradient(
                  colors: [
                    purple.withOpacity(0.75),
                    purple.withOpacity(0.50),
                  ],
                ))),
        SizedBox(height: 10),
        addServiceReaction(context, size, "2", "Reaction"),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            onChanged: (value) {
              setState(() {
                _cards.name = value;

              });
            },
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.purple, fontSize: 30),
            controller: editingController,
            decoration: InputDecoration(
              fillColor: Colors.black,
              labelText: "Name of your card",
            ),
          ),
        ),
        SizedBox(height: 50),
      ],
    );
  }

  Widget addServiceAction(context, size, value, title) {
    if (_cards.ServiceAction == null && _cards.Action == null) {

      return Container(
          height: size.height * 0.50,
          width: size.width * 0.85,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  purple.withOpacity(0.75),
                  purple.withOpacity(0.50),
                ],
              )),
          child: Column(
            children: [
              Text(title),
              Container(
                padding: EdgeInsets.all(100),
                child: FloatingActionButton(
                  heroTag: Text("btn1"),
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
                    _actionsCard = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ActionPage()),
                    );
                    setState(() {
                      _cards.ServiceAction = _actionsCard.name;
                      _cards.Action = _actionsCard.Action;
                      _cards.ActionInfo = _actionsCard.ActionInfo;

                    });
                  },
                ),
              )
            ],
          )
      );

    } else {
      print(_cards.ActionInfo);
      print(_cards.ServiceAction);
      print(_cards.Action);
      return Container(
          height: size.height * 0.50,
          width: size.width * 0.85,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  purple.withOpacity(0.75),
                  purple.withOpacity(0.50),
                ],
              )),
          child: Center(
            child: Container(
              child: Column(
                children: [
                  SizedBox(height: 130),
                  Text(_cards.ServiceAction),
                  Text(_cards.Action),
                  Text(_cards.ActionInfo),
                ]
              ),
            ),
          )
        );
    }

  }
  Widget addServiceReaction(context, size, value, title) {
    if (_cards.ServiceReaction == null && _cards.Reaction == null) {
      return Container(
          height: size.height * 0.50,
          width: size.width * 0.85,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  purple.withOpacity(0.75),
                  purple.withOpacity(0.50),
                ],
              )),
          child: Column(
            children: [
              Text(title),
              Container(
                padding: EdgeInsets.all(100),
                child: FloatingActionButton(
                  heroTag: Text("btn2"),

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
                    _reactionsCard = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReactionPage()),
                    );
                    setState(() {
                      _cards.ServiceReaction = _reactionsCard.name;
                      _cards.ReactionInfo = _reactionsCard.ReactionInfo;
                      _cards.Reaction = _reactionsCard.Reaction;
                    });
                  },
                ),
              )
            ],
          ));
    } else {
      print(_cards.ReactionInfo);
      print(_cards.ServiceReaction);
      print(_cards.Reaction);
      return Container(
          height: size.height * 0.50,
          width: size.width * 0.85,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [
                  purple.withOpacity(0.75),
                  purple.withOpacity(0.50),
                ],
              )),
          child: Center(
            child: Container(
              child: Column(
                  children: [
                    SizedBox(height: 130),
                    Text(_cards.ServiceReaction),
                    Text(_cards.Reaction),
                    Text(_cards.ReactionInfo),
                  ]
              ),
            ),
          )
      );
    }
  }

  void setCard() async {
    print("Send Data" + this.card.toString());
    print("Send Data action" + this._myActionyResult);
    print("Send this._myTriggeryResult" + this._myTriggeryResult);
    TriggerAction _action = new TriggerAction(
      type: this._myServiceResult,
      email: this.result.email,
      password: this.result.password,
      action: this._myActionyResult,
    );
    TriggerReaction _reaction = new TriggerReaction(
      type: this._myServiceResult2,
      email: this.result2.email,
      password: this.result2.password,
      reaction: this._myTriggeryResult,
    );
    DataCreateCard _card = DataCreateCard(
        title: this.NameOfCard,
        serviceAction: _action,
        serviceReaction: _reaction);
    this.card = _card;
    print("Send Data == " +
        this.card.title +
        ' ' +
        this.card.serviceReaction.email +
        ' ' +
        this.card.serviceReaction.reaction);
  }
}
