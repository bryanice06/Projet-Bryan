import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Bourse/BoursePage.dart';
import 'Imgure/auth_imgure.dart';
import 'Meteo/MeteoPage.dart';


class ReactionsCard {
  ReactionsCard(this.name, this.Reaction, this.ReactionInfo);

  String name;
  String Reaction;
  String ReactionInfo;
}
class ChooseService extends StatefulWidget {
  @override
  _ChooseServiceState createState() => _ChooseServiceState();
}

class _ChooseServiceState extends State<ChooseService> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text("Choose your service !"),);
  }
}

class ReactionPage extends StatefulWidget {
  @override
  _ReactionPageState createState() => _ReactionPageState();
}

class _ReactionPageState extends State<ReactionPage> {
  String _serviceImgure = "Imgur";
  String notDefined = "NotDefined";
  TextEditingController editingController = TextEditingController();
  String _myService = "NotDefined";
  int _value = 0;
  List<StatefulWidget> _widgetOptions = <StatefulWidget> [
    ChooseService(),
    WebViewContainer('https://api.imgur.com/oauth2/authorize?client_id=', '2342fecd4c376ad', "token", "reaction")
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(

      title: new Theme(
      child: new DropdownButton<String>(
        value: _myService,
        style: TextStyle(color: Colors.white),
        underline: Container(
          height: 2,
          color: Colors.white,
        ),
        icon: Icon(Icons.arrow_downward),
        iconSize: 24,
        elevation: 16,
        items: <DropdownMenuItem<String>>[
          new DropdownMenuItem(
            child: new Text(notDefined),
            value: notDefined,
          ),
          new DropdownMenuItem(
            child: new Text(_serviceImgure),
            value: _serviceImgure,
          ),
        ],
        onChanged: (String value) {
          setState(() {
            if (value == _serviceImgure){
              _value = 1;
              _myService  = value;
            }
            if (value == notDefined){
              _value = 0;
              _myService  = value;
            }
          });
        },

    ),
    data: new ThemeData.dark(),
    ),
      ),
      body: _widgetOptions[_value],
    );
  }

}


/*List<String> logo = ["inst", "fb"];
ServiceValue result = new ServiceValue(isGood: false);
ServiceValue result2 = new ServiceValue(isGood: false);
String _myService;
String _myService2;
String _myTrigger;
String _myReaction;
String _myServiceResult;
String _myServiceResult2;
String _myTriggeryResult;
String _myReactionyResult;
final formKey = new GlobalKey<FormState>();



List listTrigger = [
  {
    "display": "Send Email",
    "value": "Send",
  },
  {
    "display": "Like Post",
    "value": "Like",
  },
  {
    "display": "Follow someone",
    "value": "follow",
  },
  {
    "display": "Send Message",
    "value": "SendMesage",
  },
];
List listReaction = [
  {
    "display": "Send Email",
    "value": "Send",
  },
  {
    "display": "Like Post",
    "value": "Like",
  },
  {
    "display": "Follow someone",
    "value": "follow",
  },
  {
    "display": "Send Message",
    "value": "SendMesage",
  },
];


Widget block_Reaction(BuildContext context, size) {
  return Material(
      type: MaterialType.transparency,
      child: Container(
        height: size.height * 0.550,
        width: size.width * 0.90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              purple.withOpacity(0.75),
              purple.withOpacity(0.50),
            ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
        child: Column(
          children: [
            Container(
                height: 50,
                width: size.width * 0.90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                    gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.75),
                          Colors.white.withOpacity(0.50),
                        ],
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter)),
                child: Column(children: [
                  Text(
                    "Trigger",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ])),
            SizedBox(
              height: 5,
            ),
            dropdownButtonService(context, size),
            SizedBox(
              height: 5,
            ),
            button(context, size),
            SizedBox(
              height: 30,
            ),
            dropdownButtonTrigger(context, size),
          ],
        ),
      ));
}

Widget block_reReaction(BuildContext context, size) {
  return Material(
      type: MaterialType.transparency,
      child: Container(
        height: 350,
        width: size.width * 0.90,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(colors: [
              purple.withOpacity(0.75),
              purple.withOpacity(0.50),
            ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
        child: Column(
          children: [
            Container(
                height: 50,
                width: size.width * 0.90,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(10),
                      topLeft: Radius.circular(10),
                    ),
                    gradient: LinearGradient(
                        colors: [
                          Colors.white.withOpacity(0.75),
                          Colors.white.withOpacity(0.50),
                        ],
                        end: Alignment.topCenter,
                        begin: Alignment.bottomCenter)),
                child: Column(children: [
                  Text(
                    "Reaction",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ])),
            SizedBox(
              height: 5,
            ),
            dropdownButtonServiceReaction(context, size),
            SizedBox(
              height: 5,
            ),
            buttonReaction(context, size),
            SizedBox(
              height: 30,
            ),
            dropdownButtonReaction(context, size),
          ],
        ),
      ));
}

Widget button(BuildContext context, size) {
  if (result.isGood) {
    return Icon(
      Icons.check,
      color: Colors.lightGreen,
    );
  } else {
    return RaisedButton(
      onPressed: () async {
        print(_myService);
        if (!_myService.isEmpty) {
          final res = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LoginToServer(
                  myService: _myService,
                  value: result,
                )),
          );
          setState(() {
            result = res;
          });
        }
      },
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white10],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)),
        child: Container(
          constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            "Connect ?",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.purple),
          ),
        ),
      ),
    );
  }
}

Widget buttonReaction(BuildContext context, size) {
  if (result2.isGood) {
    return Icon(
      Icons.check,
      color: Colors.lightGreen,
    );
  } else {
    return RaisedButton(
      onPressed: () async {
        print(_myService2);
        if (!_myService2.isEmpty) {
          ServiceValue res = await Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    LoginToServer(myService: _myService2, value: result2)),
          );
          setState(() {
            result2 = res;
          });
        }
      },
      shape:
      RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
      padding: EdgeInsets.all(0.0),
      child: Ink(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white10],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            borderRadius: BorderRadius.circular(30.0)),
        child: Container(
          constraints: BoxConstraints(maxWidth: 300.0, minHeight: 50.0),
          alignment: Alignment.center,
          child: Text(
            "Connect ?",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.purple),
          ),
        ),
      ),
    );
  }
}

@override
void initState() {

  super.initState();
  _myService = '';
  _myTrigger = '';
  _myServiceResult = '';
  _myServiceResult2 = '';
  _myTriggeryResult = '';
  _myReactionyResult = '';
}

_saveForm() {

  setState(() {
    _myServiceResult = _myService;
    _myServiceResult2 = _myService2;
    _myTriggeryResult = _myTrigger;
    _myReactionyResult = _myReaction;
  });
}

Widget dropdownButtonService(BuildContext context, size) {
  return Container(
    width: size.width * 0.80,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(colors: [
          Colors.white.withOpacity(0.75),
          Colors.white.withOpacity(0.50),
        ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
    child: DropDownFormField(
      titleText: 'Which services you want to use ?',
      hintText: 'Please choose one',
      value: _myService,
      onSaved: (value) {
        setState(() {
          print("value " + value);
          _myService = value;
        });
      },
      onChanged: (value) {
        setState(() {
          _myService = value;
        });
      },
      dataSource: this.listService,
      textField: 'display',
      valueField: 'value',
    ),
  );
}

Widget dropdownButtonTrigger(BuildContext context, size) {
  return Container(
    width: size.width * 0.80,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(colors: [
          Colors.white.withOpacity(0.75),
          Colors.white.withOpacity(0.50),
        ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
    child: DropDownFormField(
      titleText: 'Which Triggers you want to use ?',
      hintText: 'Please choose one',
      value: _myTrigger,
      onSaved: (value) {
        setState(() {
          _myTrigger = value;
        });
      },
      onChanged: (value) {
        setState(() {
          _myTrigger = value;
        });
      },
      dataSource: this.listTrigger,
      textField: 'display',
      valueField: 'value',
    ),
  );
}

Widget dropdownButtonServiceReaction(BuildContext context, size) {
  return Container(
    width: size.width * 0.80,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(colors: [
          Colors.white.withOpacity(0.75),
          Colors.white.withOpacity(0.50),
        ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
    child: DropDownFormField(
      titleText: 'Which services you want to use ?',
      hintText: 'Please choose one',
      value: _myService2,
      onSaved: (value) {
        setState(() {
          _myService2 = value;
        });
      },
      onChanged: (value) {
        setState(() {
          _myService2 = value;
        });
      },
      dataSource: this.listService,
      textField: 'display',
      valueField: 'value',
    ),
  );
}

Widget dropdownButtonReaction(BuildContext context, size) {
  return Container(
    width: size.width * 0.80,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient: LinearGradient(colors: [
          Colors.white.withOpacity(0.75),
          Colors.white.withOpacity(0.50),
        ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
    child: DropDownFormField(
      titleText: 'Which Triggers you want to use ?',
      hintText: 'Please choose one',
      value: _myReaction,
      onSaved: (value) {
        setState(() {
          _myReaction = value;
        });
      },
      onChanged: (value) {
        setState(() {
          _myReaction = value;
        });
      },
      dataSource: this.listReaction,
      textField: 'display',
      valueField: 'value',
    ),
  );
}
}*/
