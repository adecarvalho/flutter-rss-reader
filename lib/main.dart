import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:rss_reader_app/pages/home_page.dart';
import 'package:rss_reader_app/state/app_state.dart';

//
void main() => runApp(RssReaderApp());

//
class RssReaderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppState(),
      child: (MaterialApp(
        title: 'Rss Reader ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Colors.purpleAccent,
          appBarTheme: AppBarTheme(color: Colors.purpleAccent),
        ),
        home: HomePage(),
      )),
    );
  }
}
