import 'package:flutter/foundation.dart';
import 'package:flutter_goodfood/config/const.dart';
import 'package:flutter_goodfood/pages/favorite/favorite_body.dart';
import 'package:flutter_goodfood/pages/home/widget/category.dart';
import 'package:flutter_goodfood/pages/home/home_body.dart';
import 'package:flutter_goodfood/pages/home/widget/product.dart';
import 'package:flutter_goodfood/pages/seen/seen_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_goodfood/providers/category_provider.dart';
import 'package:flutter_goodfood/providers/product_provider.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  static const routeName = "/";
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedIndex = 0;

  late Future _dataFuture;

  @override
  //lưu trữ thay đổi sau khi chuyển đổi trang
  void didChangeDependencies() {
    _dataFuture = Provider.of<ProductProvider>(context).readJson();
    // TODO: implement didChangeDependencies
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static final List<Widget> _widgetOptions = <Widget>[
    HomeBody(),
    const FavoriteBody(),
    const SeenBody(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _dataFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Món ăn ngon"),
              backgroundColor: dColorMain,
            ),
            body: Center(
              child: _widgetOptions.elementAt(_selectedIndex),
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Trang chủ',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: 'Yêu thích',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.timelapse_sharp),
                  label: 'Đã xem',
                ),
              ],
              currentIndex: _selectedIndex,
              onTap: _onItemTapped,
              backgroundColor: dColorMain,
              iconSize: sizeIconButton,
              selectedItemColor: dColorIconButtonInActive,
              unselectedItemColor: dColorIconButtonNotActive,
            ),
          );
        });
  }
}
