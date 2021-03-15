import 'dart:async';

import 'package:custom_switch/custom_switch.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:no_name/HomePage/BlockAction.dart';
import 'package:no_name/Model/Cards.dart';
import 'package:no_name/Services/DataCreateCard.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CardsList cards;
  bool activeCards = false;
  _HomePageState() {
    print("gangsta");
    CardsData()
        .getCards()
        .then((CardsList a) => (setState(() => this.cards = a)));
  }
  TextEditingController editingController = TextEditingController();

  final List<Widget> duplicateItems = [];
  Timer timer;
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 30), (Timer t) => {
      if (activeCards == true)
        CardsData().ActiveCards(this.cards.list)
    });
  }
  @override
  Widget build(BuildContext context) {
    final title = 'Long List';
    var size = MediaQuery.of(context).size;
    if (this.cards != null && this.cards.list != null) {
      print(cards.toJson());
      return Container(
          child: Container(
            child: Stack(
              alignment: Alignment.bottomRight,
              children: <Widget>[
                Container(
                  height: size.height * 0.900,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: this.cards.list.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: BlockAction(data: this.cards.list[index]),
                      );
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: CustomSwitch(
                    activeColor: Colors.pinkAccent,
                    value: false,
                    onChanged: (value) {
                      setState(() {
                        activeCards = !activeCards;
                      });
                      print("VALUE : $value");

                    },
                  ),
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
