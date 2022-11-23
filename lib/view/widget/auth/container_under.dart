import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razan_project/utils/thems/theme.dart';
import 'package:razan_project/view/widget/text_utils.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String textType;
  final Function() onpressed;
  const ContainerUnder(
      {required this.text,
      required this.textType,
      required this.onpressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
          color: Get.isDarkMode ? mainColor : pinkClr,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(
              text: text,
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              underLine: TextDecoration.none),
          TextButton(
              onPressed: onpressed,
              child: TextUtils(
                  text: textType,
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  underLine: TextDecoration.underline)),
        ],
      ),
    );
  }
}
