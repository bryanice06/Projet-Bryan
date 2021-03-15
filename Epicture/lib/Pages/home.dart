import 'dart:convert';

import 'package:epicture/Data/data.dart';
import 'package:epicture/Pages/screenImage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}


class _Home extends State<Home> {

  AccountImgur account = AccountImgur();
  Future<http.Response> response;
  GalleryImages galleryImages = GalleryImages();
  Map<String, dynamic>  path;
  String sort = "time";
  String sortTime = "all";
  List<Color> ValidColor = <Color>[Colors.black, Colors.white];
  dynamic setImages() {
    this.response =  this.galleryImages.getImages(this.sort, this.sortTime);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        body:LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
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
                              Container(
                                width: 5000,
                                color: Colors.white,
                                child: Column(
                                children: [
                                  displayFilter(context),
                                  displayFilterTime(context),
                                  ],
                                )
                              ),
                              HomeImage(context),
                            ],

                          )
                      )
                  )
              );
            }
        )
    );
  }
  int _value = 0;
  Widget displayFilter(context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12.0,
      children: <Widget>[
        ChoiceChip(
          pressElevation: 0.0,
          selectedColor: Colors.blue,
          backgroundColor: Colors.grey[100],
          label: Text("time"),
          selected: _value == 0,
          onSelected: (bool selected) {
            setState(() {
              _value = selected ? 0 : null;
              this.sort = "time";
              this.setImages();
            });
          },
        ),
        ChoiceChip(
          pressElevation: 0.0,
          selectedColor: Colors.blue,
          backgroundColor: Colors.grey[100],
          label: Text("viral"),
          selected: _value == 1,
          onSelected: (bool selected) {
            setState(() {
              _value = selected ? 1 : null;
              this.sort = "viral";
              this.setImages();
            });
          },
        ),
        ChoiceChip(
          pressElevation: 0.0,
          selectedColor: Colors.blue,
          backgroundColor: Colors.grey[100],
          label: Text("top"),
          selected: _value == 2,
          onSelected: (bool selected) {
            setState(() {
              _value = selected ? 2 : null;
              this.sort = "top";
              this.setImages();
            });
          },
        ),

      ],
    );
  }
  int valueTime = 0;
  Widget displayFilterTime(context) {
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 12.0,
      children: <Widget>[
        ChoiceChip(
          pressElevation: 0.0,
          selectedColor: Colors.blue,
          backgroundColor: Colors.grey[100],
          label: Text("all"),
          selected: valueTime == 0,
          onSelected: (bool selected) {
            setState(() {
              valueTime = selected ? 0 : null;
              this.sortTime = "all";
              this.setImages();
            });
          },
        ),
        ChoiceChip(
          pressElevation: 0.0,
          selectedColor: Colors.blue,
          backgroundColor: Colors.grey[100],
          label: Text("day"),
          selected: valueTime == 1,
          onSelected: (bool selected) {
            setState(() {
              valueTime = selected ? 1 : null;
              this.sortTime = "day";
              this.setImages();
            });
          },
        ),
        ChoiceChip(
          pressElevation: 0.0,
          selectedColor: Colors.blue,
          backgroundColor: Colors.grey[100],
          label: Text("week"),
          selected: valueTime == 2,
          onSelected: (bool selected) {
            setState(() {
              valueTime = selected ? 2 : null;
              this.sortTime = "week";
              this.setImages();
            });
          },
        ),
        ChoiceChip(
          pressElevation: 0.0,
          selectedColor: Colors.blue,
          backgroundColor: Colors.grey[100],
          label: Text("month"),
          selected: valueTime == 3,
          onSelected: (bool selected) {
            setState(() {
              valueTime = selected ? 3 : null;
              this.sortTime = "month";
              this.setImages();
            });
          },
        ),ChoiceChip(
          pressElevation: 0.0,
          selectedColor: Colors.blue[100],
          backgroundColor: Colors.grey[100],
          label: Text("year"),
          selected: valueTime == 4,
          onSelected: (bool selected) {
            setState(() {
              valueTime = selected ? 4 : null;
              this.sortTime = "year";
              this.setImages();
            });
          },
        ),

      ],
    );
  }
  Widget HomeImage(context) {

    this.setImages();
    return FutureBuilder(
        future: this.response,
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData)
            return new Scaffold(
                backgroundColor: Colors.blueAccent,
                body: Text('Loading...')
            );
          else if (snapshot.data.statusCode != 200) {
            return new Scaffold(
                backgroundColor: Colors.blueAccent,
                body: Text('Could not connect to weather service.')
            );
          } else {

            var json = jsonDecode(snapshot.data.body);
            List<dynamic> data = json['data'];

            return Container(
              height: 470,
              color: Colors.blueAccent,
              child: GridView.count(

                crossAxisCount: 2,
                crossAxisSpacing: 15,
                childAspectRatio: 0.82,
                padding: const EdgeInsets.all(30),
                scrollDirection: Axis.horizontal,
                children: List.generate(data.length, (index) {
                  bool isAlbum = data[index]["is_album"];
                  var path;
                  var sizeOfData = data.length;
                  print("size == " + sizeOfData.toString());
                  if (isAlbum) {
                    List<dynamic> images = data[index]["images"];
                    var link = images[0]["id"];
                    var type = images[0]["type"];
                    path = "https://i.imgur.com/" + link +
                        "." + "jpg";
                    int negValidator = 0;
                    return GestureDetector(
                      onTap: (){
                        print("Container clicked" + index.toString()+ " == "
                            + data[index].toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ScreenImage(cover: data[index]["cover"], page: 0)),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 200.0,
                            height: 130.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(7.0)),
                              color: Colors.black,
                            ),
                            child: Image.network(
                              path,
                            ),
                          ),
                          Container(
                            width: 210.0,
                            child: Row(
                              children: [
                                MaterialButton(
                                  minWidth: 45,
                                  onPressed: () => {
                                    this.account.sendLinkeImage(data[index]).then((value) {
                                      print("icccccccciiiiiii == "+ value.statusCode.toString());
                                      if (value.statusCode == 200) {
                                        print("ca marche");
                                      }
                                    })
                                  },
                                  child: Column( // Replace with a Row for horizontal icon + text
                                    children: <Widget>[
                                      Icon(Icons.thumb_up, size: 20),
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  minWidth: 45,
                                  onPressed: () {
                                    print(index);
                                    this.account.sendFavoriteImage(data[index]).then((value) {
                                      if (value.statusCode == 200) {
                                        print("ca marche");
                                      }
                                    });
                                  },
                                  child: Column( // Replace with a Row for horizontal icon + text
                                    children: <Widget> [
                                      Icon(Icons.favorite, size: 20),
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  minWidth: 45,
                                  onPressed: () => {},
                                  child: Column( // Replace with a Row for horizontal icon + text
                                    children: <Widget>[
                                      Icon(Icons.add_comment, size: 20),
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  minWidth: 45,
                                  onPressed: () {
                                    print(index);
                                    this.account.sendUnlinkeImage(data[index]).then((value) {
                                      if (value.statusCode == 200) {
                                        print("ca marche");
                                        setState(() {
                                          negValidator = 1;
                                        });
                                      }
                                    });
                                  },
                                  child: Column( // Replace with a Row for horizontal icon + text
                                    children: <Widget>[
                                      Icon(
                                          Icons.thumb_down,
                                          size: 20,
                                          color: ValidColor[negValidator],


                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    int negValidator = 0;

                    String buf = data[index]["link"].toString();
                    var link;
                    if (buf.contains("mp4")) {
                      link = buf.replaceAll("mp4", "gif");
                    } else {
                      link = buf;
                    }
                    return GestureDetector(
                      onTap: (){
                        print("Container clicked" + index.toString()+ " == "
                            + data[index].toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ScreenImage(cover: data[index]["cover"], page: 0)),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            width: 200.0,
                            height: 130.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(7.0)),
                              color: Colors.black,
                            ),
                            child: Image.network(
                              link,
                            ),
                          ),
                          Container(
                            width: 210.0,
                            child: Row(
                              children: [
                                MaterialButton(
                                  minWidth: 45,
                                  onPressed: () => {},
                                  child: Column( // Replace with a Row for horizontal icon + text
                                    children: <Widget>[
                                      Icon(Icons.thumb_up, size: 20),
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  minWidth: 45,
                                  onPressed: () {
                                    print(index);
                                    this.account.sendFavoriteImage(data[index]);
                                  },
                                  child: Column( // Replace with a Row for horizontal icon + text
                                    children: <Widget> [
                                      Icon(Icons.favorite, size: 20),
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  minWidth: 45,
                                  onPressed: () => {},
                                  child: Column( // Replace with a Row for horizontal icon + text
                                    children: <Widget>[
                                      Icon(Icons.add_comment, size: 20),
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  minWidth: 45,
                                  onPressed: () {
                                    print(index);
                                    this.account.sendUnlinkeImage(data[index]).then((value) {
                                      if (value.statusCode == 200) {
                                        print("ca marche");
                                      }
                                    });
                                  },
                                  child: Column( // Replace with a Row for horizontal icon + text
                                    children: <Widget>[
                                      Icon(Icons.thumb_down, size: 20,

                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }

                }),
              ),
            );

            // Image.network(link.toString());

          }
        }
    );
  }
}

