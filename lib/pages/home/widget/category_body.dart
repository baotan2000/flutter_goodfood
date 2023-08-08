import 'package:flutter/material.dart';
import 'package:flutter_goodfood/models/product.dart';
import 'package:flutter_goodfood/providers/product_provider.dart';
import 'package:provider/provider.dart';

import '../../../config/const.dart';

class CategoryBody extends StatelessWidget {
  const CategoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    var product = Provider.of<Product>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        // color: Colors.amber,
      ),
      width: double.infinity,
      height: 200,
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: dColorFooterImage,
          title: Center(child: Text(product.title, style: styleTittleItem)),
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Consumer<Product>(
                builder: (context, value, child) {
                  return Row(
                    children: [
                      InkWell(
                        onTap: () {
                          value.toggleIsFavorite();
                        },
                        child: Icon(
                          Icons.favorite,
                          size: sizeIconButton,
                          color: value.isFavorite ? Colors.red : Colors.white,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(value.favorite, style: styleTittleIcon),
                    ],
                  );
                },
              ),
              const SizedBox(width: 10),
              const Icon(Icons.remove_red_eye, size: sizeIconButton),
              const SizedBox(width: 5),
              Text(product.view, style: styleTittleIcon),
            ],
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            product.image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
