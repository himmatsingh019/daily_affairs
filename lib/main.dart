import 'package:flutter/material.dart';
import 'package:flutter_news/screens/categorynews.dart';

import 'screens/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
