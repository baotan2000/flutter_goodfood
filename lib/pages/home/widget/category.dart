import 'package:flutter/material.dart';
import 'package:flutter_goodfood/config/const.dart';
import 'package:flutter_goodfood/providers/category_provider.dart';

class CategoryPage extends StatelessWidget {
  static const routeName = "/category";
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Category Screen"),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(20),
        itemCount: 4,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 20);
        },
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {
              Navigator.pop(context);
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
                    title: const Center(
                        child: Text("ECHO MEDI", style: styleTittleItem)),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.favorite, size: sizeIconButton),
                        const SizedBox(width: 5),
                        const Text("123", style: styleTittleIcon),
                        const SizedBox(width: 10),
                        const Icon(Icons.remove_red_eye, size: sizeIconButton),
                        const SizedBox(width: 5),
                        const Text("123", style: styleTittleIcon),
                      ],
                    ),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(
                      "https://images.unsplash.com/photo-1682686580849-3e7f67df4015?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80",
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
