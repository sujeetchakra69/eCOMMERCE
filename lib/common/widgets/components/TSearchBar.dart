
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/size.dart';
import 'package:t_store/utility/device/device_utility.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class TSearchBar extends StatelessWidget {
  const TSearchBar({
    super.key, required this.text, this.icon, required this.showBackground, required this.showborder,
  });
  final String text;
  final IconData? icon;
  final bool showBackground, showborder;


  @override
  Widget build(BuildContext context) {
        final dark=THelperFunctions.isDarkMode(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:TSizes.defaultSpace-15),
      child: Container(
        width: TdeviceUtils.getScreenWidth(context),
        padding:const EdgeInsets.all(TSizes.md),
        decoration:BoxDecoration(
          color:showBackground? dark?TColors.dark:TColors.white: Colors.transparent,
          borderRadius: BorderRadius.circular(TSizes.cardRadiusLg),
          border: showborder? Border.all(color: TColors.black): null,
        ) ,
        child:  Row( mainAxisAlignment: MainAxisAlignment.start,
          children: [
             const Icon(Iconsax.search_normal),
              const SizedBox(width: TSizes.spaceBtwItems,),
              Text('Search for items',style: Theme.of(context).textTheme.labelLarge,)
    
          ],
        ),
      
      ),
    );
  }
}
