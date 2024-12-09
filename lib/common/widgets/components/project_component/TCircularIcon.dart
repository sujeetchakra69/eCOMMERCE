import 'package:flutter/material.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class TCircularIcon extends StatelessWidget {
  const TCircularIcon({
    super.key,
    this.width,
    this.height,
    required this.icon,
    this.color,
    this.backgroundColor,
     this.onPressed,
  });
  final double? width, height;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onPressed;


  @override
  Widget build(BuildContext context) {
    final bool dark=THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: backgroundColor !=null? 
        backgroundColor!:
         dark
            ? TColors.black.withOpacity(.9)
            : TColors.white.withOpacity(.9)
            
      ),
      child: IconButton(onPressed: () {}, icon:  Icon(icon, color: color,)),
    );
  }
}
