// ignore_for_file: prefer_const_constructors

import 'dart:developer';

import 'package:get/get.dart';
import 'package:og_flutter_2/models/product.dart';

class CartController extends GetxController {
  var products = <Product>[].obs;

  void add(Product pro) {
    products.add(pro);
  }

  int getTotalBill() {
    double sum = 0;

    for (int i = 0; i < products.length; i++) {
      sum += products[i].price;
      log("sum  = $sum");
      log("i price   = ${products[i].price}");
    }
    log("fsum  = $sum");

    return sum.toInt();
  }
}
