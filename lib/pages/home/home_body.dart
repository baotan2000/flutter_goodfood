import 'package:flutter/material.dart';
import 'package:flutter_goodfood/config/const.dart';
import 'package:flutter_goodfood/pages/home/widget/category.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 15, mainAxisSpacing: 15),
      itemCount: 10,
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
                            image: NetworkImage(
                                "https://images.unsplash.com/photo-1690380117575-82fb93cf524a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2940&q=80"))),
                  )),
              const Expanded(
                  flex: 1,
                  child: Center(
                    child: Text(
                      "Principal Solutions Administrator",
                      style: styleTittleItem,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                    ),
                  )),
            ],
          ),
        );
      },
    );
  }
}
