import 'package:flutter/material.dart';

class Price_Text extends StatelessWidget {
  const Price_Text({
    super.key,
    required this.price,
    required this.sign,
    required this.isLarge,
    required this.lineThrough,
  });
  final String price;
  final String sign;
  final bool isLarge;
  final bool lineThrough;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          sign + price,
          style: isLarge
              ? Theme.of(context).textTheme.headlineMedium!.apply(
                  decoration: lineThrough ? TextDecoration.lineThrough : null)
              : Theme.of(context).textTheme.headlineSmall!.apply(
                  decoration: lineThrough ? TextDecoration.lineThrough : null),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          textAlign: TextAlign.left,
        ),
       
      ],
    );
  }
}
