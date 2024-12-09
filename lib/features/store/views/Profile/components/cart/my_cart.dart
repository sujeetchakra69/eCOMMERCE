import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/Screens/pages/checkoutpage.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/features/store/views/Profile/components/cart/cardItemList.dart';
import 'package:t_store/utility/constants/size.dart';

// MyCart Page with extracted CartItemList widget
class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  // List to track the quantity of each item
  List<int> quantities = List<int>.filled(4, 1); // Assuming 4 items

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text('My Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: CartItemList(
          quantities: quantities,
          onIncrement: (index) {
            setState(() {
              quantities[index]++;
            });
          },
          onDecrement: (index) {
            setState(() {
              if (quantities[index] > 1) {
                quantities[index]--;
              }
            });
          },
        ),
      ),
      floatingActionButton: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 10),
          child: FloatingActionButton(
            backgroundColor: Colors.blue[300],
            onPressed: () => Get.to(Checkoutpage()),
            child: const Text(
              'CheckOut \$200',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
