import 'dart:convert';
import 'package:flutter_news/helper/news_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<NewsModel> news = [];

  Future<void> getNews() async {
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=us&apiKey=0d1e6eee171840c9b2e96b777e540a66');

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if (jsonData['status'] == "ok") {
      jsonData["articles"].forEach((element) {
        if (element['urlToImage'] != null && element['description'] != null) {
          NewsModel article = new NewsModel(
            title: element['title'],
            description: element['description'],
            imgURL: element['urlToImage'],
            // content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }
      });
    }
  }
}
