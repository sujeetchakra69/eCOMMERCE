// import 'dart:developer';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:t_store/common/favourite_button.dart';
// import 'package:t_store/common/widgets/components/DiscountCArd.dart';
// import 'package:t_store/common/widgets/components/Tslider.dart';
// import 'package:t_store/common/widgets/components/price_cart/PriceText.dart';
// import 'package:t_store/common/widgets/components/productTitleText/ProductTitleText.dart';
// import 'package:t_store/common/widgets/components/project_component/brandverification.dart';
// import 'package:t_store/common/widgets/common_shapes.dart';
// import 'package:t_store/common/widgets/components/project_component/shadowCard.dart';
// import 'package:t_store/features/store/controllers/Profile_controller.dart';
// import 'package:t_store/features/store/views/productDetail/Product_detail.dart';
// import 'package:t_store/utility/constants/colors.dart';
// import 'package:t_store/utility/constants/size.dart';
// import 'package:t_store/utility/helpers/helper_functions.dart';

// class TProductCard extends StatefulWidget {
//   const TProductCard({
//     super.key,
//     required this.index,
//     required this.allProducts,
//   });

//   final int index;
//   final List<Map<String, dynamic>> allProducts;

//   @override
//   State<TProductCard> createState() => _TProductCardState();
// }

// class _TProductCardState extends State<TProductCard> {
//   @override
//   void initState() {
//     super.initState();
//     Get.put(ProfileController());
//   }

//   @override
//   Widget build(BuildContext context) {
//     final dark = THelperFunctions.isDarkMode(context);

//     // ✅ Safely access the data
//     if (widget.allProducts.isEmpty ||
//         widget.index >= widget.allProducts.length ||
//         widget.allProducts[widget.index]["product"] == null) {
//       log("⚠️ Invalid data at index ${widget.index}");
//       return const SizedBox(); // gracefully return empty widget
//     }

//     final productData = widget.allProducts[widget.index];
//     final product = productData["product"] as Map<String, dynamic>;
//     final List<dynamic> images = product["image"] ?? [];
//     final String imageUrl = images.isNotEmpty ? images[0] : '';
//     final String name = product["name"] ?? "Unnamed Product";
//     final double price = (product["price"] ?? 0).toDouble();
//     final String brand = productData["brand"] ?? "Unknown Brand";
//     final String logo = productData["logo"] ?? "";

//     log("🟢 Product at ${widget.index}: $name | $imageUrl");

//     return GestureDetector(
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProductDetail(
//               index: widget.index,
//               firstProducts: widget.allProducts,
//             ),
//           ),
//         );
//       },
//       child: Container(
//         width: 181,
//         decoration: BoxDecoration(
//           boxShadow: [TShadowStyle.verticalProductShadow],
//           borderRadius: BorderRadius.circular(TSizes.productImageRadius),
//           color: dark ? TColors.darkgrey : TColors.white,
//         ),
//         child: Column(
//           children: [
//             // 🔹 Product image with overlay
//             TCircleContainer(
//               showBorder: false,
//               height: 180,
//               backgroundColor: dark ? TColors.dark : TColors.light,
//               child: Stack(
//                 children: [
//                   TSlider(
//                     imageUrl: imageUrl,
//                     backgroundColor: Colors.white,
//                     applyImageRadius: true,
//                   ),
//                   const DiscountCard(),
//                   const Positioned(top: 5, right: 10, child: FavouriteButton()),
//                 ],
//               ),
//             ),

//             // 🔹 Product info
//             Padding(
//               padding: const EdgeInsets.only(left: TSizes.sm),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ProductTitleText(
//                     name: name,
//                     maxLines: 2,
//                     smallSize: true,
//                     colors: Colors.black,
//                   ),
//                   const SizedBox(height: TSizes.spaceBtwItems / 2),
//                   BrandVerification(title: brand),
//                   Row(
//                     children: [
//                       Price_Text(
//                         sign: '\$',
//                         price: (price + 80).toStringAsFixed(2),
//                         lineThrough: true,
//                         isLarge: false,
//                       ),
//                       const SizedBox(width: TSizes.sm),
//                       Price_Text(
//                         sign: '\$',
//                         price: price.toStringAsFixed(2),
//                         lineThrough: false,
//                         isLarge: true,
//                       ),
//                       const Spacer(),
//                       Container(
//                         decoration: const BoxDecoration(
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(TSizes.cardRadiusMd),
//                             bottomRight: Radius.circular(TSizes.cardRadiusMd),
//                           ),
//                           color: Colors.blue,
//                         ),
//                         child: const SizedBox(
//                           width: TSizes.iconLg * 1.4,
//                           height: TSizes.iconLg * 1.3,
//                           child: Icon(Iconsax.add),
//                         ),
//                       ),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/favourite_button.dart';
import 'package:t_store/common/widgets/common_shapes.dart';
import 'package:t_store/common/widgets/components/DiscountCArd.dart';
import 'package:t_store/common/widgets/components/Tslider.dart';
import 'package:t_store/common/widgets/components/price_cart/PriceText.dart';
import 'package:t_store/common/widgets/components/productTitleText/ProductTitleText.dart';
import 'package:t_store/common/widgets/components/project_component/brandverification.dart';
import 'package:t_store/common/widgets/components/project_component/shadowCard.dart';
import 'package:t_store/features/store/controllers/Profile_controller.dart';
import 'package:t_store/features/store/views/productDetail/Product_detail.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/size.dart';

class TProductCard extends StatefulWidget {
  final int index;
  final List<Map<String, dynamic>> allProducts;

  const TProductCard({
    super.key,
    required this.index,
    required this.allProducts,
  });

  @override
  State<TProductCard> createState() => _TProductCardState();
}

class _TProductCardState extends State<TProductCard> {
  @override
  void initState() {
    super.initState();
    Get.put(ProfileController());
  }

  @override
  Widget build(BuildContext context) {
    final dark = Theme.of(context).brightness == Brightness.dark;

    // Safely access product map
    final currentItem =
        widget.allProducts[widget.index] as Map<String, dynamic>? ?? {};
    final product = currentItem["product"] as Map<String, dynamic>? ?? {};

    final String name = product['name']?.toString() ?? '';
    final int price = product['price'] is int
        ? product['price']
        : int.tryParse(product['price']?.toString() ?? '0') ?? 0;

    final List images = product['image'] is List ? product['image'] : [];
    final String imageUrl = images.isNotEmpty ? images[0].toString() : '';

    final String brand = currentItem['brand']?.toString() ?? '';

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetail(
              index: widget.index,
              product: widget.allProducts[widget.index],
            ),
          ),
        );
      },
      child: Container(
        width: 181,
        decoration: BoxDecoration(
          boxShadow: [TShadowStyle.verticalProductShadow],
          borderRadius: BorderRadius.circular(TSizes.productImageRadius),
          color: dark ? TColors.darkgrey : TColors.white,
        ),
        child: Column(
          children: [
            TCircleContainer(
              showBorder: false,
              height: 180,
              backgroundColor: dark ? TColors.dark : TColors.light,
              child: Stack(
                children: [
                  TSlider(
                    imageUrl: imageUrl,
                    backgroundColor: Colors.white,
                    applyImageRadius: true,
                  ),
                  const DiscountCard(),
                  const Positioned(top: 5, right: 10, child: FavouriteButton()),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    name: name,
                    maxLines: 2,
                    smallSize: true,
                    colors: Colors.black,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  BrandVerification(title: brand),
                  Row(
                    children: [
                      Price_Text(
                        sign: '\$',
                        price: (price + 80).toString(),
                        lineThrough: true,
                        isLarge: false,
                      ),
                      const SizedBox(width: TSizes.sm),
                      Price_Text(
                        sign: '\$',
                        price: price.toString(),
                        lineThrough: false,
                        isLarge: true,
                      ),
                      const Spacer(),
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
                          child: Icon(Iconsax.add),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
