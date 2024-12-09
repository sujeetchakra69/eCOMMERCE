
import 'package:flutter/material.dart';

class ProductTitleText extends StatelessWidget {
  const ProductTitleText({
    super.key, required this.name, required this.smallSize,  this.maxLines=1, this.textAlign, required this.colors,
  });
  final String name;
  final bool smallSize;
  final int? maxLines;
  final TextAlign? textAlign;
  final Color colors;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: smallSize? Theme.of(context).textTheme.titleSmall!.apply(color: colors) : Theme.of(context).textTheme.labelLarge!.apply(color: colors),
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      textAlign: textAlign,
      

    );
  }
}
