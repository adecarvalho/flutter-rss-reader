import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rss_reader_app/pages/flux_page.dart';
import 'package:rss_reader_app/state/app_state.dart';
import 'package:rss_reader_app/widgets/article_list.dart';

class HomePage extends StatelessWidget {
  //
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<AppState>(context, listen: true);
    //
    void actionHandler() {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => FluxPage(),
        ),
      );
    }

    //
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // title: Text('Les Articles'),
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

        //
        actions: <Widget>[
          RaisedButton.icon(
            onPressed: () {
              actionHandler();
            },
            icon: Icon(Icons.list),
            label: Text('Flux'),
            color: Colors.white,
          ),
        ],
      ),
      body: ArticleList(
        lesArticles: state.listArticle,
        loading: state.isloading,
        errors: state.errors,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          state.fetchDatas();
        },
        child: Icon(
          Icons.refresh,
          color: Colors.black,
        ),
      ),
    );
  }
}
