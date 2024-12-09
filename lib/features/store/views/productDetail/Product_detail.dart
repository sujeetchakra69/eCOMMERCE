import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/Screens/pages/productSliderImages.dart';
import 'package:t_store/features/store/views/productDetail/product_attributes.dart';
import 'package:t_store/features/store/views/productDetail/product_meta_data.dart';
import 'package:t_store/features/store/views/productDetail/widget/TRatingandShare.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/common/widgets/components/project_component/TCircularIcon.dart';
import 'package:t_store/features/store/views/productDetail/widget/buttontoCart.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/constants/size.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class ProductDetail extends StatelessWidget {
  const ProductDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(  // Make the whole page scrollable
          child: Column(
            children: [
              // Product image slider
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    // Main product image
                    Column(
                      children: [
                        const SizedBox(
                          height: 300,
                          width: double.infinity,
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Image(
                              image: AssetImage(TImages.productImage1),
                            ),
                          ),
                        ),

                        // Horizontal image slider
                        SizedBox(
                          height: 100, // Set a fixed height for the horizontal ListView
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: 6,
                            separatorBuilder: (_, __) => const SizedBox(
                              width: TSizes.spaceBtwItems,
                            ),
                            itemBuilder: (_, index) => const ProductSliderImages(
                              height: 100,
                              width: 100,
                              image: TImages.productImage10,
                            ),
                          ),
                        ),
                      ],
                    ),

                    // CustomAppBar overlayed on top of the product image
                    const Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: CustomAppBar(
                        showBackArrow: true,
                        actions: [
                          TCircularIcon(icon: Iconsax.heart5),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Container for details
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: dark ? TColors.dark : TColors.light,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Rating and share
                      TRatingandShare(),
                      SizedBox(height: TSizes.spaceBtwItems),

                      // Price, status, brand
                      TProductMetaData(),
                      SizedBox(height: TSizes.spaceBtwItems),

                      // Product attributes
                      ProductAttributes(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const ToCart(),
    );
  }
}
