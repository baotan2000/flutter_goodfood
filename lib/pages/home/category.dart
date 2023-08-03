import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage
({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(20),
      itemCount: 4,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height:20);
      },
      itemBuilder: (BuildContext context, int index) {
        return Container(
          color: Colors.amber,
          width: double.infinity,
          height: 200,
        );
      },
    );
  }
}