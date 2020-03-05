import 'package:flutter/material.dart';
import 'dart:async';
import 'package:rss_reader_app/models/article.dart';
import 'package:rss_reader_app/models/flux.dart';
import 'package:webfeed/webfeed.dart';
import 'package:http/http.dart' as http;

class AppState with ChangeNotifier {
//states
  List<Flux> _listFlux = List<Flux>();

  List<Article> _listArticle = List<Article>();

  bool isloading = true;

  String errors = '';

  String _targetUrl = 'https://www.lemonde.fr/rss/une.xml';

//
  AppState() {
    _createFlux();

    fetchDatas();
  }

//
  void _createFlux() {
    _listFlux.add(
      Flux(
          name: "Lemonde.fr",
          source: "La Une",
          url: "https://www.lemonde.fr/rss/une.xml"),
    );

    _listFlux.add(
      Flux(
          name: "Lemonde.fr",
          source: "En Continu",
          url: "https://www.lemonde.fr/rss/en_continu.xml"),
    );

    _listFlux.add(
      Flux(
          name: "Lemonde.fr",
          source: "International",
          url: "https://www.lemonde.fr/international/rss_full.xml"),
    );

    _listFlux.add(
      Flux(
          name: "lemonde.fr",
          source: "Europe",
          url: "https://www.lemonde.fr/europe/rss_full.xml"),
    );

    _listFlux.add(
      Flux(
          name: "lemonde.fr",
          source: "Amerique",
          url: "https://www.lemonde.fr/ameriques/rss_full.xml"),
    );

    _listFlux.add(
      Flux(
          name: "lemonde.fr",
          source: "Afrique",
          url: "https://www.lemonde.fr/afrique/rss_full.xml"),
    );

    _listFlux.add(
      Flux(
          name: "lemonde.fr",
          source: "Asie",
          url: "https://www.lemonde.fr/asie-pacifique/rss_full.xml"),
    );

    _listFlux.add(
      Flux(
          name: "lemonde.fr",
          source: "Proche Orient",
          url: "https://www.lemonde.fr/proche-orient/rss_full.xml"),
    );
    //
    notifyListeners();
  }

//
  void changeFlux(String id) async {
    for (var flux in _listFlux) {
      if (flux.id == id) {
        _targetUrl = flux.url;
        errors = '';
        await fetchDatas();
        return;
      }
    }
  }

//
  Future<void> _startLoading() async {
    isloading = true;
    notifyListeners();
  }

//
  List<Flux> get listFlux {
    return _listFlux;
  }

//
  List<Article> get listArticle {
    return _listArticle;
  }

//
  Future<RssFeed> _getFeed() async {
    try {
      await _startLoading();
      //
      http.Response response = await http.get(_targetUrl);

      RssFeed channel = RssFeed.parse(response.body.toString());

      return channel;
    } catch (e) {
      errors = e.toString();
      isloading = false;
      notifyListeners();
      return null;
    }
  }

//
  Future<void> fetchDatas() async {
    _listArticle = List<Article>();

    RssFeed channel = await _getFeed();

    if (channel != null) {
      //
      for (var i = 0; i < channel.items.length; i++) {
        final item = channel.items[i];

        Article article = Article(
            title: item.title,
            link: item.link,
            description: item.description,
            date: item.pubDate,
            imageurl: item.media.contents[0].url);

        _listArticle.add(article);

        isloading = false;
        errors = '';
        notifyListeners();
      }
    }
  }
}
//////
