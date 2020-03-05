import 'package:flutter/material.dart';
import 'package:rss_reader_app/models/article.dart';
import 'package:rss_reader_app/widgets/article_card.dart';
import 'package:rss_reader_app/widgets/spin_loading.dart';

class ArticleList extends StatelessWidget {
  final List<Article> lesArticles;
  final bool loading;
  final String errors;

  ArticleList({this.lesArticles, this.loading, this.errors});
  //
  @override
  Widget build(BuildContext context) {
    if (loading) {
      return SpinLoading();
    }
    //
    return ListView.builder(
        itemCount: lesArticles.length,
        itemBuilder: (context, index) {
          final item = lesArticles[index];

          return ArticleCard(item: item);
        });
  }
}
