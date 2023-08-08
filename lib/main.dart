import 'package:flutter/material.dart';
import 'package:flutter_goodfood/pages/home/widget/category.dart';
import 'package:flutter_goodfood/pages/home/widget/product.dart';
import 'package:flutter_goodfood/pages/index.dart';
import 'package:flutter_goodfood/providers/category_provider.dart';
import 'package:flutter_goodfood/providers/product_provider.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CategoryProvider()),
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/",
        routes: {
          MyApp.routeName: ((context) => const MyApp()),
          CategoryPage.routeName: ((context) => const CategoryPage()),
          ProductPage.routeName: ((context) => const ProductPage()),
        },
      ),
    ),
  );
}
