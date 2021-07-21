import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/helper/category_model.dart';
import 'package:flutter_news/helper/data.dart';
import 'package:flutter_news/helper/news.dart';
import 'package:flutter_news/helper/news_model.dart';
import '';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = new List.empty(growable: true);
  List<NewsModel> news = new List.empty(growable: true);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    news = newsClass.news;
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
              'Flutter',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            SizedBox(width: 4),
            Text(
              'News',
              style: TextStyle(
                color: Colors.blue,
              ),
            )
          ],
        ),
      ),
      body: Container(
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
              child: Column(
                children: [
                  Container(
                    height: 140,
                    child: ListView.builder(
                      itemCount: news.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return BlogTile(
                          imgUrl: news[index].imgURL,
                          title: news[index].title,
                          desc: news[index].description,
                          url: news[index].url,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryTile extends StatelessWidget {
  final imgURl, name;

  const CategoryTile({Key? key, this.imgURl, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 8, top: 8, right: 4),
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
    );
  }
}

class BlogTile extends StatelessWidget {
  final imgUrl, title, desc, url;

  const BlogTile({
    Key? key,
    required this.imgUrl,
    required this.title,
    required this.desc,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(imgUrl),
              ),
            ),
          ),
          Text(title),
          Text(desc),
        ],
      ),
    );
  }
}
