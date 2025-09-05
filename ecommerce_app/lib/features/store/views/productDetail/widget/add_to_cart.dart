import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/store/views/cart/cart_screen.dart';
import 'package:t_store/features/store/views/cart/controller/cart_controller.dart';

class AddToCart extends StatelessWidget {
  const AddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartController());
    final controller = Get.find<CartController>();

    return Container(
      height: 55,
      decoration: const BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(14),
          topRight: Radius.circular(14),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                // Decrement button
                InkWell(
                  onTap: () {
                    log("Decrement tapped");
                    controller.decrementProduct();
                  },
                  splashColor: Colors.blue.withOpacity(0.3),
                  child: const Icon(Iconsax.minus, size: 25),
                ),
                const SizedBox(width: 8),

                // Quantity text
                Obx(() {
                  log("Obx rebuilt with quantity: ${controller.quantity.value}");
                  return Text(
                    "${controller.quantity.value}",
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }),

                const SizedBox(width: 8),

                // Increment button
                InkWell(
                  onTap: () {
                    log("Increment tapped");
                    controller.incrementProduct();
                  },
                  splashColor: Colors.blue.withOpacity(0.3),
                  child: const Icon(Iconsax.add, size: 25),
                ),
              ],
            ),
          ),

          // Add to Cart button
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton(
              onPressed: () {
                log("Add to Cart tapped");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          '${controller.quantity.value} items added to cart.')),
                );

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const CartItemScreen();
                }));
              },
              style: TextButton.styleFrom(
                backgroundColor: Colors.grey[300],
                side: const BorderSide(color: Colors.transparent, width: 2.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: const Text(
                'Add to Cart',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
