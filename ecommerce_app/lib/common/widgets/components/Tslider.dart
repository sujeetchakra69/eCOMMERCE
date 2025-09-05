import 'package:flutter/material.dart';
import 'package:t_store/utility/constants/size.dart';

class TSlider extends StatelessWidget {
  const TSlider({
    super.key,
     this.width,
     this.height,
    required this.imageUrl,
     this.applyImageRadius=false,
    required this.backgroundColor,
    this.fit,
    this.padding,
     this.isNetworkImage=false,
    this.onPressed,  this.border,
  });
  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final BoxBorder? border;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        padding: padding,

        decoration: BoxDecoration(borderRadius: BorderRadius.circular(TSizes.md),border: border,color: backgroundColor),
        child: ClipRRect(
            borderRadius: applyImageRadius? BorderRadius.circular(TSizes.md):BorderRadius.zero,
            child:  Image(

              fit: fit,
              image:isNetworkImage? NetworkImage(imageUrl):AssetImage(imageUrl) as ImageProvider,
            )),
      ),
    );
  }
}
