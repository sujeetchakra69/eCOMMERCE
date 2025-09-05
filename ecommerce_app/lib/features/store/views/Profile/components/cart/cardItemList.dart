import 'package:flutter/material.dart';
import 'package:t_store/common/Add_Remove_button.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/constants/size.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({
    super.key,
    required this.quantities,
    required this.onIncrement,
    required this.onDecrement,
  });

  final List<int> quantities; // List of quantities for each item
  final ValueChanged<int> onIncrement; // Callback for incrementing
  final ValueChanged<int> onDecrement; // Callback for decrementing

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quantities.length, // Number of cart items
      itemBuilder: (context, index) {
        return   Padding(
          padding: const EdgeInsets.symmetric(vertical: TSizes.spaceBtwItems / 2),
          child: Row(
            children: [
              // Product Image
              const CircleAvatar(
                backgroundImage: AssetImage(TImages.productImage1),
                radius: 30,
              ),
              const SizedBox(width: TSizes.spaceBtwItems),

              // Product Info (title, price, size)
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nike Air Shoes', // Placeholder for product title
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Size: M', // Placeholder for size
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Color: Green', // Placeholder for color
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 4),
                    Text(
                      '\$30.00', // Placeholder for price
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),

              // Quantity Control
              QuantityControl(
                quantity: quantities[index], // Use 'index' to get the current quantity
                onDecrement: () => onDecrement(index), // Pass the index for decrement
                onIncrement: () => onIncrement(index), // Pass the index for increment
              ),
            ],
          ),
        );
      },
    );
  }
}
