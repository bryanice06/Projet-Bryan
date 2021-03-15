import 'package:epicture/Pages/screenImage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:epicture/Data/data.dart';
import 'package:http/http.dart' as http;

class Notif extends StatefulWidget {
  @override
  _Notif createState() => _Notif();
}

class _Notif extends State<Notif> {
  Future<http.Response> response;
  AccountImgur accountImgur = AccountImgur();
  Map<String, dynamic> path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.greenAccent,
        body: LayoutBuilder(
            builder: (BuildContext context,
                BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: Center(

                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SetFavImages(context),
                              SetFavImagesHidden(context),
                            ],

                          )
                      )
                  )
              );
            }
        )
    );
  }

  Widget SetFavImagesHidden(context) {
    return FutureBuilder(
        future: this.response = this.accountImgur.getImagesAccountHidden(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData)
            return new Text('');
          else if (snapshot.data.statusCode != 200) {
            return new Text('Could not connect to weather service.');
          } else {
            var json = jsonDecode(snapshot.data.body);
            List<dynamic> data = json['data'];

            return Container(
              height: 500,
              color: Colors.greenAccent,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                childAspectRatio: 0.82,
                padding: const EdgeInsets.all(30),
                scrollDirection: Axis.horizontal,
                children: List.generate(data.length, (index) {
                  List<dynamic> images = data[index]["images"];
                  var test;
                  if (images != null) {
                    var link = images[0]["id"];
                    test = "https://i.imgur.com/" + link +
                        "." + "jpg";
                    return Column(
                        children: [
                          Container(
                            width: 230.0,
                            height: 200.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(7.0)),
                              color: Colors.black,
                            ),
                            child: Image.network(
                              test,
                            ),
                          )
                        ]
                    );
                  } else {
                    String buf = data[index]["link"].toString();
                    var link;
                    if (buf.contains("mp4")) {
                      link = buf.replaceAll("mp4", "gif");
                    } else {
                      link = buf;
                    }
                    return GestureDetector(
                      onTap: () {
                        print("Container clicked" + index.toString() + " == "
                            + data[index].toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ScreenImage(cover: data[index]["cover"], page: 3)),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 230.0,
                            height: 200.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(7.0)),
                              color: Colors.black,
                            ),
                            child: Image.network(
                              link,
                            ),
                          ),
                        ],
                      ),

                    );
                  }
                }),
              ),
            );
          }
        }
    );
  }
  Widget SetFavImages(context) {
    return FutureBuilder(
        future: this.response = this.accountImgur.getImagesAccount(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData)
            return new Text('');
          else if (snapshot.data.statusCode != 200) {
            return new Text('Could not connect to weather service.');
          } else {
            var json = jsonDecode(snapshot.data.body);
            List<dynamic> data = json['data'];

            return Container(
              height: 500,
              color: Colors.greenAccent,
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                childAspectRatio: 0.82,
                padding: const EdgeInsets.all(30),
                scrollDirection: Axis.horizontal,
                children: List.generate(data.length, (index) {
                  List<dynamic> images = data[index]["images"];
                  var test;
                  if (images != null) {
                    var link = images[0]["id"];
                    test = "https://i.imgur.com/" + link +
                        "." + "jpg";
                    return GestureDetector(
                        onTap: () {
                          print("Container clicked" + index.toString() + " == "
                              + data[index].toString());
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ScreenImage(cover: data[index]["cover"], page: 3)),
                          );
                        },
                        child: Column(
                            children: [
                              Container(
                                width: 230.0,
                                height: 200.0,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(7.0)),
                                  color: Colors.black,
                                ),
                                child: Image.network(
                                  test,
                                ),

                              )
                            ]
                        ));
                  } else {
                    String buf = data[index]["link"].toString();
                    var link;
                    if (buf.contains("mp4")) {
                      link = buf.replaceAll("mp4", "gif");
                    } else {
                      link = buf;
                    }
                    print("Container clicked" + index.toString() + " == "
                        + data[index].toString());
                    return GestureDetector(
                      onTap: () {
                        print("Container clicked" + index.toString() + " == "
                            + data[index].toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ScreenImage(cover: data[index]["cover"], page: 3)),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 230.0,
                            height: 200.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(7.0)),
                              color: Colors.black,
                            ),
                            child: Image.network(
                              link,
                            ),
                          ),
                        ],
                      ),

                    );
                  }
                }),
              ),
            );
          }
        }
    );
  }
}