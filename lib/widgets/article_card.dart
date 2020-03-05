import 'package:flutter/material.dart';
import 'package:rss_reader_app/models/article.dart';
import 'package:rss_reader_app/pages/webview_page.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    Key key,
    @required this.item,
  }) : super(key: key);

  final Article item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.grey[200],
      child: ListTile(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WebViewPage(
                url: item.link,
              );
            }));
          },
          title: Text(item.title),
          subtitle: Text(item.getDate()),
          leading: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 50,
              minHeight: 50,
            ),
            child: Image.network(
              item.imageurl,
              fit: BoxFit.cover,
            ),
          )),
    );
  }
}
