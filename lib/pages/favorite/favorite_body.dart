import 'package:flutter/material.dart';
import 'package:flutter_goodfood/config/const.dart';
import 'package:flutter_goodfood/providers/product_provider.dart';
import 'package:provider/provider.dart';

class FavoriteBody extends StatefulWidget {
  const FavoriteBody({super.key});

  @override
  State<FavoriteBody> createState() => _FavoriteBodyState();
}

class _FavoriteBodyState extends State<FavoriteBody> {
  @override
  Widget build(BuildContext context) {
    var items = Provider.of<ProductProvider>(context).getItemsIsFavorite();
    return ListView.builder(
      itemCount: items.length,
      padding: const EdgeInsets.all(15),
      itemBuilder: (BuildContext context, int index) {
        return ChangeNotifierProvider.value(
          value: items[index],
          child: Dismissible(
            confirmDismiss: (direction) async {
              //search flutter dialog
              return await showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: const Text('Xóa sản phẩm yêu thích'),
                  content: const Text('Bạn chắc chắn xóa sản phẩm ?'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            },
            onDismissed: (direction) {
              items[index].handleRemoveIsFavorite();
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Xóa thành công !"),
                ),
              );
            },
            key: ValueKey<int>(index),
            // onDismissed: (DismissDirection direction) {
            //   setState(() {
            //     items.removeAt(index);
            //   });
            // },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: SizedBox(
                width: double.infinity,
                height: 140,
                child: GridTile(
                    footer: GridTileBar(
                      trailing: const Icon(
                        Icons.swipe,
                        color: dColorIconButtonNotActive,
                        size: sizeIconButton,
                      ),
                      backgroundColor: Colors.white70,
                      title: Text(
                        items[index].title,
                        style: styleTittleItem,
                      ),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(items[index].image),
                        ),
                      ),
                    )),
              ),
            ),
          ),
        );
      },
    );
  }
}
