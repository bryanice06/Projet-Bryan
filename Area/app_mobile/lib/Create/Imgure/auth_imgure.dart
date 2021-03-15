import 'package:flutter/material.dart';
import 'package:no_name/Create/Imgure/ImgurePageReaction.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ImgurePageAction.dart';
import 'ImgurePageReaction.dart';

class WebViewContainer extends StatefulWidget {
  final String clientID;
  final String url;
  final String ToKen;
  final String type;
  WebViewContainer(this.url, this.clientID, this.ToKen, this.type);
  @override
  createState() => _WebViewContainerState(this.url, this.clientID, this.ToKen, this.type);
}

class _WebViewContainerState extends State<WebViewContainer> {

  bool isLoggedIn = false;
  final String _url;
  final String _clientID;
  final String _ToKen;
  final String _type;
  _WebViewContainerState(this._url, this._clientID, this._ToKen, this._type);
  var token;

  final webViewPlugin = new FlutterWebviewPlugin();

  @override
  void initState() {
    super.initState();

    webViewPlugin.onStateChanged.listen((WebViewStateChanged state) {

      var uri_acces = Uri.parse(state.url.replaceFirst('#', '?'));

      if (uri_acces.query.contains('access_token')) {
        webViewPlugin.close();

        SharedPreferences.getInstance().then((SharedPreferences account_token) {
          this.token = uri_acces.queryParameters["access_token"];
          //account_token.setString('user_access_token', uri_acces.queryParameters["access_token"]);
          //account_token.setString('user_refresh_token', uri_acces.queryParameters["refresh_token"]);
          //account_token.setString('user_account_name', uri_acces.queryParameters["account_username"]);
          //account_token.setString('account_id', _clientID);
          setState(() {
            this.isLoggedIn = true;
          });
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    print("" + this._type );
    if (!this.isLoggedIn) {
      return WebviewScaffold(
        url: _url + _clientID + "&response_type=" + _ToKen,
      );
    } else {
      if (this._type == "action")
        return ImgurePageAction(token: this.token);
      else
        return ImgurePageReaction(token: this.token,);
    }
  }
}
