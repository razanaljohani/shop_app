import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:razan_project/view/widget/text_utils.dart';

import '../widget/category/category_widget.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15, top: 15),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(left: 15, top: 15),
              child: TextUtils(
                  text: "Category",
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  underLine: TextDecoration.none),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CategoryWidget()
        ],
      ),
    );
  }
}
