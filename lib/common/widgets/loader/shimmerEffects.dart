import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class TShimmereffects extends StatelessWidget {
  const TShimmereffects({super.key, required this.width, required this.height,  this.radius=15, this.color});

  final double width;
  final double height;
  final double? radius;
  final Color? color;


  @override
  Widget build(BuildContext context) {
    final dark=THelperFunctions.isDarkMode(context);

    return  Shimmer.fromColors(
      baseColor: dark? Colors.grey[850]!: Colors.grey[350]! ,
      highlightColor: dark? Colors.grey[700]!: Colors.grey[300]!,

      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color?? (dark? TColors.darkergrey: TColors.white),
          borderRadius: BorderRadius.circular(radius!)
        ),



      ),

    );
  }
}