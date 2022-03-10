// ignore_for_file: prefer_const_constructors


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
      Product("iPhone 13 Pro Max", 2021, 999.00, "Very Good Phone and fast"),
      Product("iPhone 12 Pro", 2020, 699.00, "Good camera and 8 GB Ram"),
      Product("Macbook studio", 2021, 4999.99, "For Creative developers"),
      Product("Nvedia 3090 Ti", 2020, 1699.99, "Mine Bitcoin for Trading"),
    ];

    await Future.delayed(Duration(seconds: 0));
    products.addAll(mList);
  }
}
