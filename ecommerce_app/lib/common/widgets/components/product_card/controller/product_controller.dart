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

  //all products
  List<Map<String, dynamic>> allProducts = shoeData.map((brand) {
    return {
      "brand": brand["brand"],
      "products": brand["products"],
      "logo": brand["logo"],
    };
  }).toList();
}
