import 'package:http/http.dart' as http;
import 'package:razan_project/utils/my_string.dart';

import '../model/product_model.dart';

class ProductServices {
  static Future<List<ProductModels>> getProduct() async {
    var response = await http.get(Uri.parse('$baseUrl/products'));

// sometimes 200 or 201
    if (response.statusCode == 200) {
      var jesonData = response.body;

      return productModelsFromJson(jesonData);
    } else {
      return throw Exception("Field to load product");
    }
  }
}
