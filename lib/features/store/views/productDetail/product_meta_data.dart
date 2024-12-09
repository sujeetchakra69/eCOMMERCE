import 'package:flutter/material.dart';

import 'package:t_store/common/widgets/components/DiscountCArd.dart';
import 'package:t_store/common/widgets/components/productTitleText/ProductTitleText.dart';
import 'package:t_store/common/widgets/components/project_component/brandverification.dart';
import 'package:t_store/common/widgets/image/circularImage.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/constants/size.dart';

class TProductMetaData extends StatelessWidget {
  const TProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const DiscountCard(),
            const SizedBox(
              width: TSizes.defaultSpace,
            ),

            //Price

            Text(
              '\$200',
              style: Theme.of(context).textTheme.titleSmall!.apply(
                  color: TColors.dark, decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: TSizes.sm,
            ),
            Text(
              '\$150',
              style: Theme.of(context).textTheme.titleLarge!.apply(
                    color: TColors.dark,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const ProductTitleText(
          name: 'Nike Air Shoes',
          smallSize: true,
          colors: TColors.dark,
        ),
        const SizedBox(height: 5),
        const Row(
          children: [
            ProductTitleText(
              name: 'Status :',
              smallSize: false,
              colors: TColors.dark,
            ),
            SizedBox(
              width: TSizes.sm,
            ),
            ProductTitleText(
              name: 'In Stock',
              smallSize: false,
              colors: TColors.dark,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),
        const Row(
          children: [

            CircularImage(image:TImages.sportIcon, height: 32, width: 32,),
            SizedBox(width: 10,),
             BrandVerification(title: 'Nike'),
          ],
        ),


      ],
    );
  }
}
