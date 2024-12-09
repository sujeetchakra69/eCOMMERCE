import 'package:flutter/material.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/size.dart';

class TCircleContainer extends StatelessWidget {
  const TCircleContainer({
    super.key, this.width, this.height,  this.radius=TSizes.cardRadiusLg,  this.padding=0, this.child,  this.backgroundColor=TColors.white, required this.showBorder, this.borderColor=TColors.dark
  });
   final double? width;
  final double? height;
  final double radius;
  final double? padding;
  final Widget? child;
  final Color backgroundColor;
  final bool showBorder;
  final Color borderColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(horizontal: padding!,vertical: padding!),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(radius),
       color:backgroundColor,
       border: showBorder? Border.all(color: borderColor): null),
      child: child,
    );
  }
}