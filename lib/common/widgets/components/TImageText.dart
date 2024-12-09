import 'package:flutter/material.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/size.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class VerticalImageText extends StatelessWidget {
  const VerticalImageText({
    super.key,
    required this.image,
    this.textColor = Colors.white,
    this.backgroundColor,
    required this.title,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: TSizes.spaceBtwItems),
      child: Column(
        children: [
          GestureDetector(
            onTap: onTap,
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
                  image: AssetImage(image),
                  fit: BoxFit.cover,
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
          SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .apply(color: textColor),
                maxLines: 1,
                textAlign: TextAlign.center,
              ))
        ],
      ),
    );
  }
}
