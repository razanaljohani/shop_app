import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:razan_project/view/screens/catugery_screen.dart';
import 'package:razan_project/view/screens/favorite_screen.dart';
import 'package:razan_project/view/screens/home_screen.dart';
import 'package:razan_project/view/screens/setteing_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs =
      [HomeScreen(), CategoryScreen(), FavoriteScreen(), SettingsScreen()].obs;

  final title = ["Arsoo shop", "catugories", "favorites", "settings"].obs;
}
