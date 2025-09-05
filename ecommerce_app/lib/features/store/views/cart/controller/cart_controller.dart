import 'dart:developer';

import 'package:get/get.dart';

class CartController extends GetxController {
  var quantity = 0.obs; // .obs makes it reactive

  // Increment the quantity
  void incrementProduct() {
    quantity.value++;
    log("aaaaaa");
  }

  // Decrement the quantity (ensure it doesn't go below 0)
  void decrementProduct() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }
}
