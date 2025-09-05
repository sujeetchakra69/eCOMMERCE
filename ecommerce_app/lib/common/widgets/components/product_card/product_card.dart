import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/favourite_button.dart';
import 'package:t_store/common/widgets/components/DiscountCArd.dart';
import 'package:t_store/common/widgets/components/Tslider.dart';
import 'package:t_store/common/widgets/components/price_cart/PriceText.dart';
import 'package:t_store/common/widgets/components/productTitleText/ProductTitleText.dart';
import 'package:t_store/common/widgets/components/project_component/brandverification.dart';
import 'package:t_store/common/widgets/common_shapes.dart';
import 'package:t_store/common/widgets/components/project_component/shadowCard.dart';
import 'package:t_store/data/repositories/demo.dart';
import 'package:t_store/features/store/controllers/Profile_controller.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/constants/size.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';
import 'package:t_store/features/store/views/productDetail/Product_detail.dart';

class TProductCard extends StatefulWidget {
  TProductCard({super.key, required this.index, required this.firstProducts});
  final int index;

  List<Map<String, dynamic>> firstProducts;

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
    final dark = THelperFunctions.isDarkMode(context);

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductDetail(
                    index: widget.index,
                    firstProducts: widget.firstProducts,
                    // productName: widget.firstProducts[widget.index]["product"]
                    //     ['name'],
                    // brand: widget.firstProducts[widget.index]["brand"],
                  )),
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
            // Thumbnail
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

                  DiscountCard(),

                  // Like button
                  Positioned(top: 5, right: 10, child: FavouriteButton()),
                ],
              ),
            ),

            // Description
            Padding(
              padding: const EdgeInsets.only(left: TSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProductTitleText(
                    name: widget.firstProducts[widget.index]["product"]['name'],
                    maxLines: 2,
                    smallSize: true,
                    colors: Colors.black,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  BrandVerification(
                      title: '${shoeData[widget.index]['brand']}'),
                  Row(
                    children: [
                      Price_Text(
                        sign: '\$',
                        price: {
                          shoeData[widget.index]["products"][widget.index]
                                  ["price"] +
                              80
                        }.toString(),
                        lineThrough: true,
                        isLarge: false,
                      ),
                      const SizedBox(width: TSizes.sm),
                      Price_Text(
                        sign: '\$',
                        price:
                            '${shoeData[widget.index]["products"][widget.index]["price"]}',
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
