// QuantityControl Widget (Extracted)
import 'package:flutter/material.dart';

class QuantityControl extends StatelessWidget {
  final int quantity;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const QuantityControl({
    super.key,
    required this.quantity,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Subtract Button
        IconButton(
          onPressed: onDecrement,
          icon: const Icon(Icons.remove_circle_outline),
        ),

        // Display the current quantity
        Text(
          '$quantity',
          style: const TextStyle(fontSize: 16),
        ),

        // Add Button
        IconButton(
          onPressed: onIncrement,
          icon: const Icon(Icons.add_circle_outline),
        ),
      ],
    );
  }
}