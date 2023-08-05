import 'package:flutter/material.dart';
import 'package:flutter_goodfood/models/product.dart';

class ProductProvider extends ChangeNotifier {
  final List<Product> _items = [];
  List<Product> get items => [..._items];
}
