import 'package:epicture/Pages/screenVideo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:epicture/Data/data.dart';
import 'package:video_player/video_player.dart';

import 'dart:io';


class ScreenImage extends StatefulWidget {
  ScreenImage({this.cover, this.page});
  String cover;
  int page;
  @override
  _ScreenImage createState() => _ScreenImage(cover: this.cover, page: this.page);
}
class _ScreenImage extends State<ScreenImage> {
  _ScreenImage({this.cover, this.page});
  String cover;
  String link;
  String description;
  String title;
  Future<http.Response> response;
  Future<http.Response>  responseCom;
  GalleryImages galleryImages = GalleryImages();
  static List<Color> _colorOptions = <Color>[
    Colors.blueAccent,
    Colors.redAccent,
    Colors.yellowAccent,
    Colors.greenAccent,
    Colors.pinkAccent
  ];
  int page;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: _colorOptions[page],
        title: Text('Image Info'),
      ),
      body: Center(
        child:
            callImage(context),
        )
      );
  }

  Widget callImage(context) {
    return FutureBuilder(
        future: this.response = this.galleryImages.getImage(this.cover),
        builder: (BuildContext context, snapshot) {
          if (!snapshot.hasData)
            return new Scaffold(
                backgroundColor: _colorOptions[page],
                body: Text('')
            );
          else if (snapshot.data.statusCode != 200) {
            return new Scaffold(
                backgroundColor: _colorOptions[page],
                body: Text('Could not connect to weather service.')
            );
          } else {

            var json = jsonDecode(snapshot.data.body);
            var data = json['data'];
            this.link = data['link'];
            print("descrition ==" + data.toString());
            if (data["type"] != "video/mp4") {

              if ( data["title"] == null) {
                this.title = " ";

                if ( data["description"] == null) {
                  this.description = " ";
                  return ImagePattern(context);
                } else {
                  this.description = data["description"].toString();
                  return ImagePattern(context);
                }
              } else {
                this.title = data["title"].toString();
                if ( data["description"] == null) {
                  this.description = " ";
                  return ImagePattern(context);
                } else {
                  print("descrition ==" + this.description);

                  this.description = data["description"].toString();
                  return ImagePattern(context);
                }
              }

            }

            else {
              print("title = " + data["description"].toString());
              if ( data["title"] == null) {
                if ( data["description"] == null) {
                  return VideoApp(link: this.link, title: " ", description: " ",);
                } else {
                  return VideoApp(link: this.link, title: " ", description: data["description"].toString(),);
                }
              } else {
                if ( data["description"] == null) {
                  return VideoApp(link: this.link, title:data["title"].toString(), description: " ",);
                } else {
                  return VideoApp(link: this.link, title:data["title"].toString(), description: data["description"].toString(),);
                }
              }

            }
          }
        }
    );
  }
  Widget ImagePattern(context) {
    return Center(
      child: Column(
        children: [
          Container(
              width: 50,
              height: 50,
              child: Text(
                this.title,
                style: TextStyle(
                  fontSize: 40,
                ),
              )
          ),
          Container(
            width: 400,
            height: 400,
            child: Image.network(
                this.link
            ),
          ),
          Container(
              width: 50,
              height: 50,
              child: Text(
                  this.description
              )
          ),
        ],
      ),
    );
  }
}

