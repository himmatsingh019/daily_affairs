import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/models/category_model.dart';
import 'package:flutter_news/helper/data.dart';
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/models/news_model.dart';
import 'package:flutter_news/screens/categorynews.dart';
import 'package:flutter_news/widget/category_tile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = new List.empty(growable: true);
  List<NewsModel> news = new List.empty(growable: true);
  bool _isloading = false;

  @override
  void initState() {
    _isloading = true;

    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  void getNews() async {
    await News.getNews();
    news = News.news;
    setState(() {
      _isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
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
      body: _isloading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 140,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryTile(
                          imgURl: categories[index].imgURL,
                          name: categories[index].categoryName,
                        );
                      },
                    ),
                  ),
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
