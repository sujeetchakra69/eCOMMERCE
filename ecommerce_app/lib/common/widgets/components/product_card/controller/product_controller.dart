import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:t_store/data/repositories/demo.dart';

class ProductController extends GetxController {
  List<Map<String, dynamic>> firstProducts = shoeData.map((brand) {
    return {
      "brand": brand["brand"],
      "product": brand["products"][0], // first product
      "logo": brand["logo"],
    };
  }).toList();

  // all products
  List<Map<String, dynamic>> brandProducts = shoeData.map((brand) {
    return {
      "brand": brand["brand"],
      "product": brand["products"],
      "logo": brand["logo"],
    };
  }).toList();
  List<Map<String, dynamic>> allProducts = shoeData.expand((brand) {
    // Map each product to include its brand and logo
    return (brand["products"] as List).map((product) {
      return {
        "brand": brand["brand"],
        "logo": brand["logo"],
        "product": product, // each individual product
      };
    });
  }).toList();
}
