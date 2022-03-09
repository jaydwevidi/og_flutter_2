// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:og_flutter_2/get_x/card_controller.dart';
import 'package:og_flutter_2/get_x/shopping_controller.dart';
import 'package:og_flutter_2/models/product.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My App"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(
                builder: (controller) {
                  return ListView.builder(
                    itemCount: controller.products.length,
                    itemBuilder: (BuildContext context, int index) {
                      return GetX<ShoppingController>(builder: (
                        controller2,
                      ) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: ListTile(
                                subtitle: Container(),
                                contentPadding: EdgeInsets.all(10),
                                leading: Icon(
                                    CupertinoIcons
                                        .antenna_radiowaves_left_right,
                                    semanticLabel: "lable",
                                    size: 25,
                                    textDirection: TextDirection.ltr),
                                title: Text(controller2.products[index].name),
                                trailing: Column(
                                  children: [
                                    Text(
                                      "\$" + controller2.products[index].price.toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 2),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            "Add to Cart",
                                          ),
                                        )),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                    },
                  );
                },
              ),
            ),
            Container(
              height: 10,
              color: Colors.amber,
            ),
            SizedBox(
              height: 20,
            ),
            GetX<CartController>(builder: (controller) {
              return Text(
                "Number Of Products in Cart = ${controller.products.length}",
                style: TextStyle(
                  fontSize: 28,
                  color: Colors.black,
                ),
              );
            }),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
