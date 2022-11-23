import "package:flutter/material.dart";
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:razan_project/logic/controllers/auth_controller.dart';
import 'package:razan_project/logic/controllers/theme_controller.dart';
import 'package:razan_project/utils/thems/theme.dart';

import '../widget/setteing/dark_mode_widget.dart';
import '../widget/setteing/language_widget.dart';
import '../widget/setteing/logout_widget.dart';
import '../widget/setteing/profile_widget.dart';
import '../widget/text_utils.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ProfileWidget(),
          const SizedBox(
            height: 10,
          ),
          Divider(
            color: Get.isDarkMode ? Colors.white : Colors.grey,
            thickness: 2,
          ),
          const SizedBox(
            height: 20,
          ),
          TextUtils(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            text: "GENERAL".tr,
            color: Get.isDarkMode ? pinkClr : mainColor,
            underLine: TextDecoration.none,
          ),
          const SizedBox(
            height: 20,
          ),
          DarkModeWidget(),
          const SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          const SizedBox(
            height: 20,
          ),
          LogOutWidget(),
        ],
      ),
    );
  }
}
