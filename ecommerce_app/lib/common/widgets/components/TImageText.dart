import 'package:flutter/material.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/size.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class VerticalImageText extends StatelessWidget {
  VerticalImageText(
      {super.key,
      this.backgroundColor,
      required this.brands,
      required this.index});
  List<Map<String, dynamic>> brands;
  final int index;

  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: backgroundColor ??
                    (THelperFunctions.isDarkMode(context)
                        ? TColors.black
                        : TColors.white),
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image(
                  image: AssetImage("${brands[index]["logo"]}"),
                  fit: BoxFit.contain,
                  height: 40,
                  width: 40,
                  color: THelperFunctions.isDarkMode(context)
                      ? TColors.light
                      : TColors.dark,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: TSizes.spaceBtwItems,
          ),
          Text(
            "${brands[index]["brand"]}",
            style: Theme.of(context)
                .textTheme
                .labelSmall!
                .apply(color: Colors.black),
            maxLines: 2,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
