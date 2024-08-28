import 'package:flutter/material.dart';



class CartModel extends ChangeNotifier {
  // list of items on sale
  final List _shopItems = const [
    // [ itemName, itemPrice, imagePath, color,description ]
    ["Avocado", "4.00", "images/avacado.jpg", Colors.green,"Avocado: Often called a superfood, avocados are creamy, nutrient-dense fruits with a subtle, buttery flavor. They are rich in healthy monounsaturated fats, vitamins (such as Vitamin K, E, and C), and minerals (like potassium). Avocados are versatile and can be used in salads, smoothies, sandwiches, or enjoyed on their own with a touch of seasoning. Their smooth texture and mild taste make them a popular choice for both savory and sweet dishes."],
    ["Chilli", "2.50", "images/chilli.jpg", Colors.yellow,"Chili: A vibrant, spicy fruit from the Capsicum species, chili peppers are known for their heat and flavor. They come in various colors and sizes, and their spiciness is measured in Scoville Heat Units (SHU). Widely used in cuisines around the world, they add a kick to dishes and are also praised for their health benefits, including boosting metabolism and providing vitamins."],
    ["Garlic", "12.80", "images/garlic.jpg", Colors.brown,"**Garlic** is a bulbous plant from the Allium family, known for its strong, pungent flavor and aroma. It's widely used in cooking to enhance the taste of dishes and is also valued for its potential health benefits, including antimicrobial and anti-inflammatory properties. Garlic is rich in vitamins and minerals, particularly vitamin C, vitamin B6, and manganese. It is often used both raw and cooked in a variety of cuisines around the world."],
    ["Onion", "1.00", "images/onion.jpg", Colors.blue,"The onion (Allium cepa) is a versatile, bulbous vegetable known for its pungent flavor and aroma. It has a layered structure with papery skin that can range in color from white and yellow to red and purple. Onions are widely used in cooking for their ability to add depth and sweetness to a variety of dishes, including soups, stews, and salads. They can be eaten raw, sautéed, caramelized, or pickled. Onions are also valued for their potential health benefits, including anti-inflammatory and antioxidant properties."],
    ["Potato", "100.00", "images/potato.jpg", Colors.orange,"The potato is a versatile and widely consumed root vegetable. It has a starchy texture and mild flavor that makes it an excellent base for many dishes. Potatoes can be prepared in numerous ways, including boiling, baking, frying, and mashing. They are rich in carbohydrates, dietary fiber, and essential vitamins such as Vitamin C and B6. Potatoes are a staple food in many cultures and are enjoyed globally in various culinary forms."],
    ["Tomato", "15.00", "images/tomato.jpg", Colors.red,"Tomatoes are vibrant, juicy fruits commonly used in culinary dishes worldwide. They come in various colors, including red, yellow, and green, and can be eaten raw in salads, cooked into sauces, or used in soups. Rich in vitamins C and K, potassium, and antioxidants like lycopene, tomatoes offer numerous health benefits, including improved heart health and reduced risk of certain cancers. Their versatility and flavor make them a staple ingredient in many cuisines."],
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