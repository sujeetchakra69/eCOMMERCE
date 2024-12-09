import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/common_shapes.dart';
import 'package:t_store/common/widgets/components/DiscountCArd.dart';
import 'package:t_store/common/widgets/components/Tslider.dart';
import 'package:t_store/common/widgets/components/price_cart/PriceText.dart';
import 'package:t_store/common/widgets/components/productTitleText/ProductTitleText.dart';
import 'package:t_store/common/widgets/components/project_component/TCircularIcon.dart';
import 'package:t_store/common/widgets/components/project_component/brandverification.dart';
import 'package:t_store/common/widgets/components/project_component/shadowCard.dart';
import 'package:t_store/features/store/views/productDetail/Product_detail.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/constants/size.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class Singlecardhorizontal extends StatelessWidget {
  const Singlecardhorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ProductDetail()),
        );
      },
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 350),
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            boxShadow: [TShadowStyle.verticalProductShadow],
            borderRadius: BorderRadius.circular(TSizes.productImageRadius),
            color: dark ? TColors.darkgrey : TColors.light  ,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TCircleContainer(
                showBorder: false,
                width: 180,
                height: 180,
                backgroundColor: dark ? TColors.dark : TColors.light,
                child: const Stack(
                  children: [
                    TSlider(
                      imageUrl: TImages.productImage2,
                      backgroundColor: Colors.white,
                      applyImageRadius: true,
                    ),
                    DiscountCard(),
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
              const SizedBox(width: TSizes.sm),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProductTitleText(
                      name: 'Nike Air Shoes',
                      maxLines: 1,
                      smallSize: true,
                      colors: Colors.black,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems / 4),
                    const BrandVerification(title: 'Nike'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            Price_Text(
                              sign: '\$',
                              price: '100',
                              lineThrough: true,
                              isLarge: false,
                            ),
                            Price_Text(
                              sign: '\$',
                              price: '90',
                              lineThrough: false,
                              isLarge: true,
                            ),
                          ],
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(TSizes.cardRadiusMd),
                              bottomRight: Radius.circular(TSizes.cardRadiusMd),
                            ),
                            color: Colors.blue,
                          ),
                          child: const SizedBox(
                            width: TSizes.iconLg * 1.4,
                            height: TSizes.iconLg * 1.3,
                            child: Icon(
                              Iconsax.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
