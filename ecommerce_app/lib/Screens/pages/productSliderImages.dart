
import 'package:flutter/material.dart';

class ProductSliderImages extends StatelessWidget {
  const ProductSliderImages({
    super.key,
    required this.image,
    required this.height,
    required this.width,
  });
  final String image;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Image(
      width: width,
      height: height,
      image: AssetImage(image),
    );
  }
}