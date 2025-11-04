import 'package:flutter/material.dart';

import 'package:t_store/common/widgets/components/DiscountCArd.dart';
import 'package:t_store/common/widgets/components/productTitleText/ProductTitleText.dart';
import 'package:t_store/common/widgets/components/project_component/brandverification.dart';
import 'package:t_store/common/widgets/image/circularImage.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/size.dart';

class TProductMetaData extends StatelessWidget {
  TProductMetaData(
      {super.key,
      // required this.productName,
      // required this.brand,
      required this.product,
      required this.index});
  // final String productName;
  // final String brand;
  final int index;
  Map<String, dynamic> product;

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
              '\$${product["price"] + 80}',
              style: Theme.of(context).textTheme.titleSmall!.apply(
                  color: TColors.dark, decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(
              width: TSizes.sm,
            ),
            Text(
              '\$${product["price"]}',
              style: Theme.of(context).textTheme.titleLarge!.apply(
                    color: TColors.dark,
                  ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        ProductTitleText(
          name: product["name"],
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
        // Row(
        //   children: [
        //     CircularImage(
        //       image: "${product["logo"]}",
        //       height: 50,
        //       width: 50,
        //     ),
        //     const SizedBox(
        //       width: 10,
        //     ),
        //     BrandVerification(title: product["brand"]),
        //   ],
        // ),
      ],
    );
  }
}
