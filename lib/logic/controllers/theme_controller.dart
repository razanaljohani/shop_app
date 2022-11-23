import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage boxStorge = GetStorage();
  final key = "isDarkMoods";

  saveThemeDataBox(bool isDark) {
    boxStorge.write(key, isDark);
  }

  bool getThemeDataBox() {
    return boxStorge.read<bool>(key) ?? false;
  }

  ThemeMode get themeDataGet =>
      getThemeDataBox() ? ThemeMode.dark : ThemeMode.light;

  void changesTheme() {
    Get.changeThemeMode(getThemeDataBox() ? ThemeMode.light : ThemeMode.dark);

    saveThemeDataBox(!getThemeDataBox());
  }
}
