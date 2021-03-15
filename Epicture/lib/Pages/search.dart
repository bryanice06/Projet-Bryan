import 'dart:convert';

import 'package:epicture/Data/data.dart';
import 'package:epicture/Pages/screenImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class Search extends StatefulWidget {
  @override
  _Search createState() => _Search();
}

class _Search extends State<Search> {
  AccountImgur account = AccountImgur();
  GalleryImages galleryImages = GalleryImages();
  TextEditingController _controller;
  var search = "cat";
  Future<http.Response> response;
  String sort = "time";
  String sortTime = "all";
  dynamic setSearch() {
    this.response = this.galleryImages.getSearch(this.search, this.sort, this.sortTime);

  }
  var path;
  List<dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.redAccent,
        body: LayoutBuilder(
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
                            color: Colors.white,
                            width: 5000,

                            child: Column(
                              children: [
                                SizedBox(height: 10),

                                searchBar(context),
                                displayFilter(context),
                                displayFilterTime(context),
                              ],
                            ),
                          ),
                          displayImages(context),
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
              this.setSearch();
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
              this.setSearch();
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
              this.setSearch();
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
              this.setSearch();
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
              this.setSearch();
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
              this.setSearch();
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
              this.setSearch();
            });
          },
        ),ChoiceChip(
          pressElevation: 0.0,
          selectedColor: Colors.blue,
          backgroundColor: Colors.grey[100],
          label: Text("year"),
          selected: valueTime == 4,
          onSelected: (bool selected) {
            setState(() {
              valueTime = selected ? 4 : null;
              this.sortTime = "year";
              this.setSearch();
            });
          },
        ),

      ],
    );
  }
  Widget searchBar(context) {
    print("gang");
    return Container(
      height: 50,
      width: 300,
      child: TextField(
        controller: _controller,
        autofocus: false,
        decoration: InputDecoration(
          labelText: "Search...",
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(),
          ),

        ),
        onChanged: (String value) {
          print("search  == " + value);
          setState(() {
            this.search = value;
            print("search  == " + this.search);
            this.setSearch();
          });
        },
      ),
    );
  }
  Widget displayImages(context) {
    this.setSearch();
    return FutureBuilder(
        future: this.response,
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData)
            return new Scaffold(
                backgroundColor: Colors.redAccent,
                body: Text('Loading...')
            );
          else if (snapshot.data.statusCode != 200) {
            return new Scaffold(
                backgroundColor: Colors.redAccent,
                body: Text('Could not connect to weather service.')
            );
          } else {
            var json = jsonDecode(snapshot.data.body);
            this.data = json['data'];
            return Container(
              height: 440,
              color: Colors.redAccent,
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                padding: const EdgeInsets.all(30),
                scrollDirection: Axis.horizontal,
                children: List.generate(data.length, (index) {
                  bool isAlbum = data[index]["is_album"];
                  var path;
                  var toto;
                  var sizeOfData = data.length;
                  print("size == " + sizeOfData.toString());
                  var title = data[index]["title"];
                  if (title.length > 10) {
                    toto = title.substring(0, 10);
                  } else {
                    toto = title;
                  }
                  if (isAlbum) {
                    List<dynamic> images = data[index]["images"];
                    var link = images[0]["id"];
                    var type = images[0]["type"];
                    path = "https://i.imgur.com/" + link +
                        "." + "jpg";
                    return GestureDetector(
                      onTap: (){
                        print("Container clicked" + index.toString()+ " == "
                            + data[index].toString());
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ScreenImage(cover: data[index]["cover"], page: 1,)),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              toto.toUpperCase(), style: TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: 200.0,
                            height: 110.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(7.0)),
                              color: Colors.black,
                            ),
                            child: Image.network(
                              path,
                            ),
                          ),
                          Container(
                            width: 200.0,
                            child: Row(
                              children: [
                                MaterialButton(
                                  minWidth: 20,
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
                                      Icon(Icons.thumb_up, size: 15),
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  minWidth: 20,
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
                                      Icon(Icons.favorite, size: 15),
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  minWidth: 20,
                                  onPressed: () => {},
                                  child: Column( // Replace with a Row for horizontal icon + text
                                    children: <Widget>[
                                      Icon(Icons.add_comment, size: 15),
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  minWidth: 20,
                                  onPressed: () => {},
                                  child: Column( // Replace with a Row for horizontal icon + text
                                    children: <Widget>[
                                      Icon(Icons.thumb_down, size: 15),
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
                          MaterialPageRoute(builder: (context) => ScreenImage(cover: data[index]["cover"], page: 1,)),
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              toto.toUpperCase(), style: TextStyle(fontSize: 18, color: Colors.black),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            width: 200.0,
                            height: 110.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(7.0)),
                              color: Colors.black,
                            ),
                            child: Image.network(
                              link,
                            ),
                          ),
                          Container(
                            width: 200.0,
                            child: Row(
                              children: [
                                MaterialButton(
                                  minWidth: 20,
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
                                      Icon(Icons.thumb_up, size: 15),
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  minWidth: 20,
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
                                      Icon(Icons.favorite, size: 15),
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  minWidth: 20,
                                  onPressed: () => {},
                                  child: Column( // Replace with a Row for horizontal icon + text
                                    children: <Widget>[
                                      Icon(Icons.add_comment, size: 15),
                                    ],
                                  ),
                                ),
                                MaterialButton(
                                  minWidth: 20,
                                  onPressed: () => {},
                                  child: Column( // Replace with a Row for horizontal icon + text
                                    children: <Widget>[
                                      Icon(Icons.thumb_down, size: 15),
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
