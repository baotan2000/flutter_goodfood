import 'package:flutter/material.dart';
import 'package:flutter_goodfood/models/category.dart';

class CategoryProvider extends ChangeNotifier {
  final List<Category> _items = [];
  List<Category> get items => [..._items];
}
