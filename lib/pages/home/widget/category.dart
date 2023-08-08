import 'package:flutter/material.dart';
import 'package:flutter_goodfood/config/const.dart';
import 'package:flutter_goodfood/pages/home/widget/product.dart';
import 'package:flutter_goodfood/providers/product_provider.dart';
import 'package:provider/provider.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = "/category";
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final data = ModalRoute.of(context)!.settings.arguments as Map;
    var products = Provider.of<ProductProvider>(context)
        .getItemsWithCategoryId(data["categoryId"]);
    // print(data);
    print(products);
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
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                // color: Colors.amber,
              ),
              width: double.infinity,
              height: 200,
              child: GridTile(
                  footer: GridTileBar(
                    backgroundColor: dColorFooterImage,
                    title: Center(
                        child: Text(products[index].title,
                            style: styleTittleItem)),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.favorite, size: sizeIconButton),
                        const SizedBox(width: 5),
                        Text(products[index].favorite, style: styleTittleIcon),
                        const SizedBox(width: 10),
                        const Icon(Icons.remove_red_eye, size: sizeIconButton),
                        const SizedBox(width: 5),
                        Text(products[index].view, style: styleTittleIcon),
                      ],
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      products[index].image,
                      fit: BoxFit.cover,
                    ),
                  )),
            ),
          );
        },
      ),
    );
  }
}
