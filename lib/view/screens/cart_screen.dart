import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razan_project/logic/controllers/cart_controller.dart';
import 'package:razan_project/utils/thems/theme.dart';

import '../widget/cart/cart_product_card.dart';
import '../widget/cart/cart_total.dart';
import '../widget/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          title: Text("Cart Items"),
          elevation: 0,
          backgroundColor: Get.isDarkMode ? darkGreyClr : mainColor,
          actions: [
            IconButton(
                onPressed: () {
                  controller.clearAllProducts();
                },
                icon: Icon(Icons.backspace))
          ],
        ),
        body: Obx(() {
          if (controller.productsMap.isEmpty) {
            return EmptyCart();
          } else {
            return SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 600,
                    child: ListView.separated(
                        itemBuilder: ((context, index) {
                          return CartProductCard(
                            productModels:
                                controller.productsMap.keys.toList()[index],
                            index: index,
                            quantinity:
                                controller.productsMap.values.toList()[index],
                          );
                        }),
                        separatorBuilder: ((context, index) => SizedBox(
                              height: 20,
                            )),
                        itemCount: controller.productsMap.length),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: CartTotal(),
                  )
                ],
              ),
            );
          }
        }),
      ),
    );
  }
}
