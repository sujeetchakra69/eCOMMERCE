import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/features/store/views/cart/controller/cart_controller.dart';

class CartItemScreen extends StatelessWidget {
  const CartItemScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              children: [
                const Text("Total Quantity: "),
                Text("${controller.quantity.value}"),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            ListView.separated(
                itemBuilder: (context, index) {
                  return const ListTile();
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 4.0,
                    ),
                itemCount: controller.quantity.value)
          ],
        ),
      ),
    );
  }
}
