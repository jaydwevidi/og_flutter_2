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
                          padding: const EdgeInsets.all(4.0),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: ListTile(
                                subtitle: Text("\$" +
                                    controller2.products[index].price
                                        .toString()),
                                contentPadding: EdgeInsets.all(10),
                                leading: SizedBox(
                                  child: Image.network(
                                      "https://assets.swappie.com/cdn-cgi/image/width=600,height=600,dpr=2,fit=contain,format=auto/swappie-iphone-13-blue.png"),
                                ),
                                title: Text(
                                  controller2.products[index].name,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                trailing: SizedBox(
                                  height: 100,
                                  child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 2),
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(18.0),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          cartController.products.add(
                                            Product(
                                              shoppingController
                                                  .products[index].name,
                                              shoppingController
                                                  .products[index].id,
                                              shoppingController
                                                  .products[index].price,
                                              shoppingController
                                                  .products[index].discription,
                                            ),
                                          );
                                        },
                                        child: Text(
                                          "Add to Cart",
                                        ),
                                      )),
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
                "Total Value Bill = \$${controller.getTotalBill()}             .",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              );
            }),
            SizedBox(
              height: 25,
            ),
          ],
        ),
      ),
      floatingActionButton: GetX<CartController>(builder: (cController) {
        return FloatingActionButton.extended(
          onPressed: () {},
          icon: Icon(
            CupertinoIcons.cart,
          ),
          label: Text(
            cController.products.length.toString(),
            textScaleFactor: 1.5,
          ),
        );
      }),
    );
  }
}
