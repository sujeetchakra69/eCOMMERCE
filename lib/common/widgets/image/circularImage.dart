
import 'package:flutter/material.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class CircularImage extends StatelessWidget {
  const CircularImage({
    super.key,
     required this.image, this.backgroundColor, this.width=56, this.height=56, this.fit,
  });
  final String image;
  final Color? backgroundColor;
  final double? width,height;
  final BoxFit? fit;


  @override
  Widget build(BuildContext context) {
    final bool dark=THelperFunctions.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(56),
        color:backgroundColor??( dark? TColors.black: TColors.white),
         
      ),
      child: Image(image: AssetImage(image),
      fit: BoxFit.contain,
      color: dark? TColors.light: TColors.dark,),
    );
  }
}