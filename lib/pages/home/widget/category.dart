import 'package:flutter/material.dart';
import 'package:flutter_goodfood/config/const.dart';
import 'package:flutter_goodfood/pages/home/widget/category_body.dart';
import 'package:flutter_goodfood/pages/home/widget/product.dart';
import 'package:flutter_goodfood/providers/product_provider.dart';
import 'package:provider/provider.dart';

import '../../../models/product.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = "/category";
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    var products = Provider.of<ProductProvider>(context)
        .getItemsWithCategoryId(data["categoryId"]);
    // // print(data);
    // print(products);
    return Scaffold(
      appBar: AppBar(
        title: Text(data["title"]),
        backgroundColor: dColorMain,
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: products.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 20);
        },
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  ProductPage.routeName,
                  arguments: {"id": products[index].id},
                );
              },
              child: ChangeNotifierProvider<Product>.value(
                value: products[index],
                child: const CategoryBody(),
              ));
        },
      ),
    );
  }
}
