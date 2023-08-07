import 'package:flutter/material.dart';
import 'package:flutter_goodfood/config/const.dart';
import 'package:flutter_goodfood/pages/home/widget/category.dart';
import 'package:flutter_goodfood/providers/category_provider.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: CategoryProvider().readJson(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        print(snapshot);
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        var categoryItem = snapshot.hasData ? snapshot.data : [];
        return snapshot.hasData
            ? GridView.builder(
                padding: EdgeInsets.all(10),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 15),
                itemCount: categoryItem.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //     builder: ((_) => CategoryPage(title: index)),
                      //   ),
                      // );
                      Navigator.pushNamed(context, CategoryPage.routeName,
                          arguments: {"title": index});
                    },
                    child: Column(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          categoryItem[index].image))),
                            )),
                        Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                categoryItem[index].name.toString(),
                                style: styleTittleItem,
                                maxLines: 2,
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ],
                    ),
                  );
                },
              )
            : const Center(
                child: Text("Not Data"),
              );
      },
    );
  }
}
