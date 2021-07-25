import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/models/news_model.dart';

class CategoryNewsScreen extends StatelessWidget {
  CategoryNewsScreen({required this.news});
  List<NewsModel> news = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        // centerTitle: true,
        actions: [
          Opacity(
            opacity: 0,
            child: Icon(Icons.ac_unit),
          )
        ],
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Daily',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(width: 4),
            Text(
              'Affairs',
              style: TextStyle(
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 16),
              child: ListView.builder(
                  itemCount: news.length,
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return BlogTile(
                      imgUrl: news[index].imgURL,
                      title: news[index].title,
                      desc: news[index].description,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final imgUrl, title, desc;

  const BlogTile({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.desc,
    // required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 8, right: 8, bottom: 8),
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imgUrl,
              height: 200,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 8),
          Text(
            title,
            maxLines: 2,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 4),
          Text(
            desc,
            maxLines: 2,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[800],
            ),
          ),
        ],
      ),
    );
  }
}
