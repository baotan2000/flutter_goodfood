import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_goodfood/config/const.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://plus.unsplash.com/premium_photo-1666183669448-e41821d3ba2e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1740&q=80"),
                fit: BoxFit.cover,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite, size: sizeIconButton),
                      SizedBox(width: 5),
                      Text("123", style: styleTittleIcon),
                    ],
                  ),
                ),
                Container(
                  width: 120,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(15)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.remove_red_eye, size: sizeIconButton),
                      SizedBox(width: 5),
                      Text("123", style: styleTittleIcon),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Text(
                    "Explicabo id et aliquid ad omnis atque placeat vel. Quo ut eos quidem. Aut enim itaque modi eum."),
                SizedBox(
                  height: 20,
                ),
                Column(
                  children: [
                    Container(
                      child: Center(
                          child: Text("Nguyên liệu", style: styleTittleItem)),
                      width: 167,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                          textAlign: TextAlign.justify,
                          "Itaque nihil officiis exercitationem consectetur. Ut minus expedita voluptas culpa suscipit sed ut. Voluptas deserunt dolorem consequuntur ea. Est modi fuga dolores quia sit quod est blanditiis dolores. Et libero et voluptatem in eius et ipsam corporis."),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Center(
                          child:
                              Text("Cách thực hiện", style: styleTittleItem)),
                      width: 167,
                      height: 35,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(20))),
                    ),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                          textAlign: TextAlign.justify,
                          "Itaque nihil officiis exercitationem consectetur. Ut minus expedita voluptas culpa suscipit sed ut. Voluptas deserunt dolorem consequuntur ea. Est modi fuga dolores quia sit quod est blanditiis dolores. Et libero et voluptatem in eius et ipsam corporis."),
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(2)),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
