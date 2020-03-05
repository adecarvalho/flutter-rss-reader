import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
  final String url;

  WebViewPage({this.url});
  //
  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  final _key = UniqueKey();

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/monde_logo.jpg',
              fit: BoxFit.contain,
              height: 32,
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: widget.url,
              onWebViewCreated: (WebViewController controller) {
                _controller.complete(controller);
              },
            ),
          ),
        ],
      ),
    );
  }
}
