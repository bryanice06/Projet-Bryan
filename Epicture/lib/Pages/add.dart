import 'dart:ui';

import 'package:epicture/Data/data.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import 'dart:io';

class Add extends StatefulWidget {
  @override
  _Add createState() => _Add();
}

class _Add extends State<Add> {
  AccountImgur account = AccountImgur();
  final _picker = ImagePicker();
  bool isGood = true;
  String title = " ";
  String description = " ";
  PickedFile _image;
  _imgFromCamera() async {
    PickedFile image = await _picker.getImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }

  _imgFromGallery() async {
    PickedFile image = await _picker.getImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('Photo Library'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('Camera'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
  @override
  Widget build(BuildContext context) {
    if (isGood == true) {

      return Scaffold(
        backgroundColor: Colors.yellowAccent,
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 32,
            ),
            Center(
              child: GestureDetector(
                onTap: () {
                  _showPicker(context);
                },
                child: _image != null
                      ? ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.file(
                      File(_image.path),
                      width: 200,
                      height: 100,
                      fit: BoxFit.fitHeight,
                    ),
                  )
                      : Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(50)),
                    width: 100,
                    height: 100,
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.grey[800],
                    ),
                  ),
                ),
              ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(top: 5),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Title",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(),
                  ),
                ),
                onChanged: (String value) {
                  setState(() {
                    this.title = value;
                  });
                },
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              margin: EdgeInsets.only(top: 5),
              child: TextField(
                decoration: InputDecoration(
                    labelText: "Description",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(),
                    )
                ),
                onChanged: (String value) {
                  setState(() {
                    this.description = value;
                  });
                },
              ),
            ),
            IconButton(
              onPressed: () {
                this.account.sendImage(File(_image.path), this.title, this.description).then((response) {
                  print(response.statusCode);
                  if (response.statusCode == 200) {
                    setState(() {
                      this.isGood = false;
                    });
                  }
                });
              },
              icon: Icon(
                Icons.add,
                color: Colors.black,
              ),
            )
          ],
        ),
      );
    } else {
      return Text("image uploaded");
    }

  }
}
