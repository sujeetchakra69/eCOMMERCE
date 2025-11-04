import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/common_shapes.dart';
import 'package:t_store/common/widgets/components/Tslider.dart';
import 'package:t_store/common/widgets/components/project_component/brandverification.dart';
import 'package:t_store/common/widgets/components/project_component/shadowCard.dart';
import 'package:t_store/features/store/views/store/components/brandProduct.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/size.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

// ignore: must_be_immutable
class TBrandCard extends StatelessWidget {
  TBrandCard({super.key, required this.products, required this.index});

  final List<Map<String, dynamic>> products;
  final int index;

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Get.to( Brandproduct(products: products,));
        // Action for card tap
      },
      child: Container(
        padding: const EdgeInsets.all(10), // Adjust padding as needed
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkgrey : TColors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Thumbnail
            TCircleContainer(
              showBorder: false,
              height: 58, // Adjusted height for layout consistency
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: TSlider(
                width: 50,
                imageUrl: products[index]["logo"],
                backgroundColor: Colors.transparent,
                applyImageRadius: true,
              ),
            ),
            // Description
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BrandVerification(title: products[index]["brand"]),
                  Text(
                    '25 Products',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
