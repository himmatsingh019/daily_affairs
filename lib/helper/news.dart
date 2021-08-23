import 'dart:convert';
import 'package:flutter_news/models/news_model.dart';
import 'package:http/http.dart' as http;

class News {
  static List<NewsModel> news = [];

  static Future<void> getNews() async {
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=in&apiKey=0d1e6eee171840c9b2e96b777e540a66');

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          NewsModel article = new NewsModel(
            title: element['title'],
            description: element['description'],
            imgURL: element['urlToImage'],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }

  static Future<List<NewsModel>?> getcategorynews(String category) async {
    List<NewsModel> categorynews = [];
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=0d1e6eee171840c9b2e96b777e540a66");
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          NewsModel article = new NewsModel(
            description: element['description'],
            imgURL: element['urlToImage'],
            articleUrl: element['url'],
            title: element['title'],
          );

          categorynews.add(article);
        }
      });
      return categorynews;
    }
  }
}
