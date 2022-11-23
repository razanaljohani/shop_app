import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:razan_project/model/product_model.dart';
import 'package:razan_project/sevices/product_services.dart';

class ProductController extends GetxController {
  var productList = <ProductModels>[].obs;
  var favouritesList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var stoarge = GetStorage();

  //search
  var searchList = <ProductModels>[].obs;
  TextEditingController searchTextController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    stoarge.read<List>("isFavoriteLost");
    List? storedShopping = stoarge.read("isFavoriteLost");
    if (storedShopping != null) {
      favouritesList =
          storedShopping.map((e) => ProductModels.fromJson(e)).toList().obs;
    }
    getProducts();
  }

  void getProducts() async {
    var products = await ProductServices.getProduct();

    try {
      isLoading.value = true;
      // isLoading(true);
      if (products.isNotEmpty) {
        productList.addAll(products);
      }
    } finally {
      isLoading(false);
    }
  }

  void manageFavorite(int productId) async {
    var existingIndex =
        favouritesList.indexWhere((element) => element.id == productId);
    if (existingIndex >= 0) {
      favouritesList.removeAt(existingIndex);

      await stoarge.remove("isFavoriteLost");
    } else {
      var productID =
          productList.firstWhere((element) => element.id == productId);
      favouritesList.add(productID);
      await stoarge.write("isFavoriteLost", favouritesList);
    }
  }

  bool isFavorites(int prudectId) {
    return favouritesList.any((element) => element.id == prudectId);
  }

  // Search Bar Logic

  void addSerachList(String searchName) {
    searchName = searchName.toLowerCase();

    searchList.value = productList.where((search) {
      var searchTitle = search.title.toLowerCase();
      var searchPrice = search.price.toString().toLowerCase();
      return searchTitle.contains(searchName) ||
          searchPrice.contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchTextController.clear();
    addSerachList("");
  }
}
