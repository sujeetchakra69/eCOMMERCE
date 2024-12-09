
import 'package:flutter/material.dart';
import 'package:t_store/utility/constants/size.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 0,
      left: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.yellow.withOpacity(0.8),
        ),
        height: 180 * 0.20, // 20% of the container's height
        padding: const EdgeInsets.symmetric(
            horizontal: TSizes.sm, vertical: TSizes.sm),
        child: Center(
          child: Text(
            '25%',
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .apply(color: Colors.black),
          ),
        ),
      ),
    );
  }
}