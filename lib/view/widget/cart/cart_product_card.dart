import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razan_project/logic/controllers/cart_controller.dart';
import 'package:razan_project/utils/thems/theme.dart';

import '../../../model/product_model.dart';

class CartProductCard extends StatelessWidget {
  final ProductModels productModels;
  final int index;
  final int quantinity;
  CartProductCard(
      {super.key,
      required this.productModels,
      required this.index,
      required this.quantinity});

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20, right: 20, top: 5),
      height: 130,
      width: 100,
      decoration: BoxDecoration(
          color: Get.isDarkMode
              ? pinkClr.withOpacity(0.7)
              : mainColor.withOpacity(0.4),
          borderRadius: BorderRadius.circular(20)),
      child: Row(children: [
        Container(
          height: 120,
          width: 100,
          margin: EdgeInsets.only(left: 15),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  image: NetworkImage(productModels.image), fit: BoxFit.cover)),
        ),
        SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 15,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productModels.title,
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "\$ ${controller.productSubTotal[index].toStringAsFixed(2)}",
                style: TextStyle(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      controller.removeProductsFarmCart(productModels);
                    },
                    icon: Icon(
                      Icons.remove_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    )),
                Text(
                  "$quantinity",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                IconButton(
                    onPressed: () {
                      controller.addProductToCart(productModels);
                    },
                    icon: Icon(
                      Icons.add_circle,
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                    ))
              ],
            ),
            IconButton(
                onPressed: () {
                  controller.removeOneProduct(productModels);
                },
                icon: Icon(
                  Icons.delete,
                  size: 20,
                  color: Get.isDarkMode ? Colors.black : Colors.red,
                ))
          ],
        )
      ]),
    );
  }
}
