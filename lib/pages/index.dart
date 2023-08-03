import 'package:flutter_goodfood/config/const.dart';
import 'package:flutter_goodfood/pages/favorite/favorite_body.dart';
import 'package:flutter_goodfood/pages/home/home_body.dart';
import 'package:flutter_goodfood/pages/seen/seen_body.dart';
import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

   int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomeBody(),
    FavoriteBody(),
    SeenBody(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Món ăn ngon"),
        backgroundColor: dColorMain,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),      bottomNavigationBar: BottomNavigationBar(
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
  }
}