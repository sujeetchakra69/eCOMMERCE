import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/Layout/Product_gridView.dart';
import 'package:t_store/common/widgets/components/TCategories.dart';
import 'package:t_store/common/widgets/components/product_card/HomeProductCard.dart';
import 'package:t_store/features/store/views/store/components/BrandCardStore.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/constants/size.dart';

class Tab_Bar extends StatelessWidget {
  const Tab_Bar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              // Wrap the TCircleContainer in a SizedBox
              const BrandCardStore(
                images: [
                  TImages.productImage1,
                  TImages.productImage2,
                  TImages.productImage3
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const BrandCardStore(
                images: [
                  TImages.productImage5,
                  TImages.productImage4,
                  TImages.productImage2
                ],
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),

              TCategories(
                title: 'You might like',
                onPressed: () {},
              ),

              ProductGridView(
                  itemCount: 4, itemBuilder: (_, index) => const TProductCard())
            ],
          ),
        )
      ],
    );
  }
}
