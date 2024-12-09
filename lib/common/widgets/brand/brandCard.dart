import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/common_shapes.dart';
import 'package:t_store/common/widgets/components/Tslider.dart';
import 'package:t_store/common/widgets/components/project_component/brandverification.dart';
import 'package:t_store/common/widgets/components/project_component/shadowCard.dart';
import 'package:t_store/features/store/views/store/components/brandProduct.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/constants/size.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class TBrandCard extends StatelessWidget {
  const TBrandCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Get.to(const Brandproduct());
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
              child: const TSlider(
                width: 50,
                imageUrl: TImages.adidasLogo,
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
                  const BrandVerification(title: 'Adidas'),
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
