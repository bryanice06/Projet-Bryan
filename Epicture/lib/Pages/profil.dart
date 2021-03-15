import 'package:epicture/Pages/screenImage.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:epicture/Data/data.dart';
import 'package:flutter/painting.dart';
import 'package:http/http.dart' as http;

class Profil extends StatefulWidget {
  @override
  _Profil createState() => _Profil();
}

class _Profil extends State<Profil> {
  Future<http.Response> response;
  AccountImgur accountImgur = AccountImgur();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.pinkAccent,
        body: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                  child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: viewportConstraints.maxHeight,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          profileHost(context),
                          myPictures(context),
                        ],

                      )
                  )
              );
            }
        )
    );
  }
  Widget myPictures(context) {
    return Container(
        color: Colors.pinkAccent,
        height: 300,
        child: FutureBuilder(
            future: this.response = this.accountImgur.getMyImagesAccount(),
            builder: (BuildContext context, snapshot) {
              if (!snapshot.hasData)
                return new Text('');
              else if (snapshot.data.statusCode != 200) {
                return new Text('Could not connect to weather service.');
              } else {
                final json =jsonDecode(snapshot.data.body);
                print("iciiiiii == " + json.toString());
                List<dynamic> data = json['data'];
                print("iciii" + data[0].toString());

                return Container(
                    height: 500,
                    child: GridView.count(
                      crossAxisCount: 2,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.82,
                      padding: const EdgeInsets.all(30),
                      scrollDirection: Axis.horizontal,
                      children: List.generate(data.length, (index) {
                        print("iciii" + data[index].toString());
                        var link =  data[index]["link"];
                        var title =  (data[index]["title"] != null) ?  data[index]["title"] : "";
                        var description =  (data[index]["description"] != null) ?  data[index]["description"] : "";
                        return GestureDetector(
                            onTap: () {
                          print("Container clicked" + index.toString() + " == "
                              + data[index].toString());
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Pattern(
                                link: link,
                                title: title,
                                description: description,
                            )),
                          );
                        },
                        child:Container(

                          height: 300,
                          child: Center(
                            child: Image.network(
                              data[index]["link"],
                            ),
                          ),
                          // ),
                        ));
                      },
                    )
                ));
              }
            }
        )
    );
  }
  Widget profileHost(context) {
    return FutureBuilder(
        future: this.response = this.accountImgur.getAccountBase(),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData)
            return new Text('');
          else if (snapshot.data.statusCode != 200) {
            return new Text('Could not connect to weather service.');
          } else {
            var json = jsonDecode(snapshot.data.body);
            var data = json['data'];

            return Container(
              color: Colors.pinkAccent,
              child: Center(
                child: Column(
                  children: [
                    Container(
                      height: 500,
                      decoration: BoxDecoration(
                        image: new DecorationImage(
                            image: new NetworkImage(data['cover']),
                            fit:BoxFit.cover
                        ),
                      ),
                      child: Column(
                        children: [
                          SizedBox(width: 2000),
                          SizedBox(height: 50),
                          CircleAvatar(
                            radius: 50.0,
                            backgroundImage: NetworkImage(
                                data['avatar']
                            ),
                            backgroundColor: Colors.transparent,
                          ),
                          SizedBox(height: 10),
                          Text(
                            data['url'], style: TextStyle(fontSize: 30, color: Colors.white),
                          ),
                          SizedBox(height: 10),
                          Text(
                              data['reputation'].toString() + " pts  .  " + data['reputation_name'], style: TextStyle(fontSize: 25, color: Colors.white)
                          ),
                          SizedBox(height: 30),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      child: Center(
                        child: Text(
                            data['bio'].toString(), style: TextStyle(fontSize: 20, color: Colors.white)
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        }
    );
  }

}
class Pattern extends StatelessWidget {
  Pattern({this.link, this.title, this.description});
  String link;
  String title;
  String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text('Image Info'),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                width: 50,
                height: 50,
                child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 40,
                    ),

                )
            ),
            Container(
              width: 400,
              height: 400,
              child: Image.network(
                  link
              ),
            ),
            Container(
                width: 50,
                height: 50,
                child: Text(
                    description
                )
            ),
          ],
        ),
      ),
    );
  }
}

