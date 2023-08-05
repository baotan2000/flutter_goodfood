import 'package:flutter/material.dart';
import 'package:flutter_goodfood/pages/home/widget/category.dart';
import 'package:flutter_goodfood/pages/index.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      MyApp.routeName: (context) => MyApp(),
      CategoryPage.routeName: (context) => CategoryPage(),
    },
  ));
}
