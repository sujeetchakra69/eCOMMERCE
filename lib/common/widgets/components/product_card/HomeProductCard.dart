import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/components/DiscountCArd.dart';
import 'package:t_store/features/store/views/productDetail/Product_detail.dart';
import 'package:t_store/common/widgets/common_shapes.dart';
import 'package:t_store/common/widgets/components/Tslider.dart';
import 'package:t_store/common/widgets/components/price_cart/PriceText.dart';
import 'package:t_store/common/widgets/components/productTitleText/ProductTitleText.dart';
import 'package:t_store/common/widgets/components/project_component/TCircularIcon.dart';
import 'package:t_store/common/widgets/components/project_component/brandverification.dart';
import 'package:t_store/common/widgets/components/project_component/shadowCard.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/constants/size.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class TProductCard extends StatelessWidget {
  const TProductCard({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>const ProductDetail()));
      },
      child: Container(
        width: 181,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: THelperFunctions.isDarkMode(context)
              ? TColors.darkgrey
              : TColors.white,
        ),
        child: Column(
          children: [
            //thumbnail
            TCircleContainer(
              showBorder: false,
              height: 180,
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: const Stack(
                children: [
                  TSlider(
                    imageUrl: TImages.productImage2,
                    backgroundColor: Colors.white,
                    applyImageRadius: true,
                  ),

                  // Add this Positioned widget to cover 25% of the container with yellow
                  DiscountCard(),

                  //thumbnail favourite

                  Positioned(
                    top: 0,
                    right: 0,
                    child: TCircularIcon(
                      icon: Iconsax.heart5,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
            //description

            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                children: [
                  const ProductTitleText(
                    name: 'Nike Air Shoes',
                    maxLines: 2,
                    smallSize: true,
                    colors: Colors.black,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),
                  const BrandVerification(title: 'Nike',),
                  Row(
                    children: [
                      const Price_Text(
                        sign: '\$',
                        price: '100',
                        lineThrough: true,
                        isLarge: false,
                      ),
                      const SizedBox(width: TSizes.sm,),
                      const Price_Text(
                        sign: '\$',
                        price: '90',
                        lineThrough: false,
                        isLarge: true,
                      ),
                      const Spacer(),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomRight:
                                  Radius.circular(TSizes.cardRadiusMd)),
                          color: Colors.blue,
                        ),
                        child: const SizedBox(
                          width: TSizes.iconLg * 1.4,
                          height: TSizes.iconLg * 1.3,
                          child: Icon(
                            Iconsax.add,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
