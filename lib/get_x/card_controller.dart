// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:get/get.dart';
import 'package:og_flutter_2/models/product.dart';

class CartController extends GetxController {
  var products = <Product>[].obs;

  void add(Product pro) {
    products.add(pro);
  }
}
