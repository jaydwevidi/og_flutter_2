// ignore_for_file: prefer_const_constructors

import 'dart:html';

import 'package:get/get.dart';
import 'package:og_flutter_2/models/product.dart';

class ShoppingController extends GetxController {
  var products = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    getProductList();
  }

  void getProductList() async {
    var mList = [
      Product("iphone 13 Pro Max", 2021, 999.99, "discription"),
      Product("iphone 12 Pro", 2020, 699.99, "discription 2222"),
      Product("iphone 13 Pro Max", 2021, 999.99, "discription"),
      Product("iphone 12 Pro", 2020, 699.99, "discription 2222"),
    ];

    await Future.delayed(Duration(seconds: 0));
    products.addAll(mList);
  }
}
