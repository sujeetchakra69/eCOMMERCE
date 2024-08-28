import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color ]
    ["Avocado", "4.00", "images/avacado.jpg", Colors.green],
    ["Chilli", "2.50", "images/chilli.jpg", Colors.yellow],
    ["Garlic", "12.80", "images/garlic.jpg", Colors.brown],
    ["Onion", "1.00", "images/onion.jpg", Colors.blue],
    ["Potato", "100.00", "images/potato.jpg", Colors.orange],
    ["Tomato", "15.00", "images/tomato.jpg", Colors.red],
  ];

  // list of cart items
  final List _cartItems = [];

  get cartItems => _cartItems;

  get shopItems => _shopItems;

  // add item to cart
  void addItemToCart(int index) {
    _cartItems.add(_shopItems[index]);
    notifyListeners();
  }

  // remove item from cart
  void removeItemFromCart(int index) {
    _cartItems.removeAt(index);
    notifyListeners();
  }

  // calculate total price
  String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartItems.length; i++) {
      totalPrice += double.parse(cartItems[i][1]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}