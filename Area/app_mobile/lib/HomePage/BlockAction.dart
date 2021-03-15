import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:custom_switch/custom_switch.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:no_name/Model/Cards.dart';



class BlockAction extends StatelessWidget {
  final Cards data;
  BlockAction({this.data});
  Color purple = Colors.deepPurple;
  List<String> logo = ["inst", "fb"];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    if (this.data != null) {

    return Material(
        type: MaterialType.transparency,
        child: Container(
          height: size.height * 0.30,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          gradient: LinearGradient(colors: [
            purple.withOpacity(0.75),
            purple.withOpacity(0.50),
          ], end: Alignment.topCenter, begin: Alignment.bottomCenter)),
      child: Column(
        children: [
          SizedBox(height: 20),
          Text(
            '' +this.data.name,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25, color: Colors.white,),
          ),
          SizedBox(height: 20),
          Center(
            child: Row(
            children: [
              Text(
               "               " + this.data.ServiceAction +  "    ",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white70),
              ),
              Icon(
                Icons.arrow_forward_outlined
              ),
              Text(
                '    ' + this.data.ServiceReaction,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white70),
              ),
            ],
          ),),
          SizedBox(height: 5),
          Text(this.data.Action + "   /   " + this.data.Reaction,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: Colors.white70)),
          SizedBox(height: 30),
          CustomSwitch(
            activeColor: Colors.pinkAccent,
            value: false,
            onChanged: (value) {
              print("VALUE : $value");

            },
          ),
        ],
      ),
    ));
    } else {
      return Center(
          child: Loading(
              indicator: BallPulseIndicator(), size: 100.0, color: Colors.purpleAccent)
      );
    }
  }
}
