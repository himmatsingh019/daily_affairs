import 'package:flutter/material.dart';
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/models/news_model.dart';
import 'package:flutter_news/screens/categorynews.dart';

class CategoryTile extends StatelessWidget {
  final imgURl, name;

  const CategoryTile({Key? key, this.imgURl, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        List<NewsModel>? news = await News.getcategorynews(name);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNewsScreen(
                      news: news!,
                    )));
      },
      child: Container(
        padding: EdgeInsets.only(left: 8, top: 8, right: 4),
        child: Column(
          children: [
            CircleAvatar(
              radius: 46,
              backgroundImage: NetworkImage(imgURl),
            ),
            SizedBox(height: 4),
            Text(
              name,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
