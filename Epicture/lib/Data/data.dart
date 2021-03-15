import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class GalleryImages {

  Future<http.Response> getImages(String sort, String sortTime) async {
    print("laaaaaaaaaaaa\n");
    var context = await SharedPreferences.getInstance();
    print("iciiiii = " + context.getString("user_access_token"));
    Future<http.Response> response = http.get("https://api.imgur.com/3/gallery/hot/" + sort + "/" + sortTime + "/0?showViral=true&mature=false&album_preview=false",
    headers: {
      "Authorization": "Bearer " + context.getString("user_access_token")
    });
    return response;
  }

  Future<http.Response> getImage(String cover) async {
    print("laaaaaaaaaaaa\n");
    var context = await SharedPreferences.getInstance();
    print("iciiiii = " + context.getString("user_access_token"));
    Future<http.Response> response = http.get("https://api.imgur.com/3/image/" + cover,
        headers: {
          "Authorization": "Bearer " + context.getString("user_access_token")
        });
    return response;
  }
  Future<http.Response> getSearch(String searched, String sort, String sortTime) async {
    print("laaaaaaaaaaaa\n");
    var context = await SharedPreferences.getInstance();
    print("laaaaaaaaaaaa\n");
    print("laaaaaaaaaaaa    ===  " + searched);

    Future<http.Response> response = http.get(
        "https://api.imgur.com/3/gallery/search/" + sort + "/" + sortTime + "/1?q=" + searched,
        headers: {
          "Authorization": "Client-ID " + context.getString("account_id")
        }
    );
      return response;
    }
  Future<http.Response> getCommentsImage(image) async {
    var context = await SharedPreferences.getInstance();
    Future<http.Response> response = http.get("https://api.imgur.com/3/gallery/" + image + "/comments/all/" ,
        headers: {
          "Authorization": "Bearer " + context.getString("user_access_token")
        });
    return response;
  }
}

class AccountImgur {

  Future<http.Response> getAccountBase() async {
    var context = await SharedPreferences.getInstance();
    Future<http.Response> response = http.get(
        "https://api.imgur.com/3/account/" + context.getString("user_account_name"),
        headers: {
          "Authorization": "Client-ID " + context.getString("account_id")
        }
      );
    return response;
  }
  Future<http.Response> getImagesAccount() async {
    var context = await SharedPreferences.getInstance();
    Future<http.Response> response = http.get("https://api.imgur.com/3/account/" + context.getString("user_account_name") + "/gallery_favorites/",
        headers: {
          "Authorization": "Bearer " + context.getString("user_access_token")
        });
    return response;
  }
  Future<http.Response> getImagesAccountHidden() async {
    var context = await SharedPreferences.getInstance();

    Future<http.Response> response = http.get("https://api.imgur.com/3/account/" + context.getString("user_account_name") + "/unorganized_favorites/",
        headers: {
          "Authorization": "Bearer " + context.getString("user_access_token")
        });
    return response;
  }
  Future<http.Response> getMyImagesAccount() async {
    var context = await SharedPreferences.getInstance();
    Future<http.Response> response = http.get("https://api.imgur.com/3/account/me/images" ,
        headers: {
          "Authorization": "Bearer " + context.getString("user_access_token")
        });
    return response;
  }

  Future<http.Response> sendImage(pickedFile, String title, String description) async {
    var context = await SharedPreferences.getInstance();
    List<int> bytes = await pickedFile.readAsBytesSync();
    String conv = convert.base64Encode(bytes);
    print("convvvv ===== "+ conv);
    Future<http.Response> response = http.post("https://api.imgur.com/3/upload/" ,
      headers: {
        "Authorization": "Bearer " + context.getString("user_access_token")

      },
        body: {
          "image": conv,
          "title": title,
          "description": description,
        }
    );
    return response;
  }
  Future<http.Response> sendFavoriteImage(image) async {
    var context = await SharedPreferences.getInstance();
    print(image["cover"]);
    Future<http.Response> response = http.post("https://api.imgur.com/3/image/" + image["cover"] + "/favorite",
        headers: {
          "Authorization": "Bearer " + context.getString("user_access_token")

        },
    );

    return response;
  }
  Future<http.Response> sendLinkeImage(image) async {
    var context = await SharedPreferences.getInstance();
    print(image["cover"]);
    Future<http.Response> response = http.post("https://api.imgur.com/3/gallery/" + image["id"] + "/vote/up/",
      headers: {
        "Authorization": "Bearer " + context.getString("user_access_token")

      },
    );
    return response;
  }
  Future<http.Response> sendUnlinkeImage(image) async {
    var context = await SharedPreferences.getInstance();
    print(image["cover"]);
    Future<http.Response> response = http.post("https://api.imgur.com/3/gallery/" + image["id"] + "/vote/down/",
      headers: {
        "Authorization": "Bearer " + context.getString("user_access_token")

      },
    );
    return response;
  }
}

