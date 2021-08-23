import 'package:flutter/material.dart';

var darkTheme = new ThemeData(
    accentColor: Colors.blue,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.black),
      bodyText1: TextStyle(color: Colors.grey[800]),
    ));

var lightTheme = new ThemeData(
    accentColor: Colors.blue,
    brightness: Brightness.dark,
    textTheme: TextTheme(
      headline1: TextStyle(color: Colors.white),
      bodyText1: TextStyle(color: Colors.grey[500]),
    ),
    primaryColor: Colors.blue);
