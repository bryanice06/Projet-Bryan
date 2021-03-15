import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';


class DataCard {
  DataCard(this.name,  this.creator, this.status);
  String name;
  String creator;
  bool status;
}
class BlockActionCreate extends StatelessWidget {
  final DataCard data;
  BlockActionCreate({this.data});
  Color purple = Colors.deepPurple;
  List<String> logo = ["inst", "fb"];
  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: Container(
          height: 120,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            purple.withOpacity(0.75),
            purple.withOpacity(0.50),
          ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
      child: Column(
        children: [
          Text(
            this.data.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white,),
          ),
          Text(
            this.data.creator,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white70),
          ),
          CustomSwitch(
            activeColor: Colors.pinkAccent,
            value: this.data.status,
            onChanged: (value) {
              print("VALUE : $value");

            },
          ),
        ],
      ),
    ));
  }
}
