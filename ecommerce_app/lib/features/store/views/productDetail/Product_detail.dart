import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/Screens/pages/productSliderImages.dart';
import 'package:t_store/common/favourite_button.dart';
import 'package:t_store/common/widgets/components/product_card/controller/product_controller.dart';
import 'package:t_store/features/store/views/productDetail/product_attributes.dart';
import 'package:t_store/features/store/views/productDetail/product_meta_data.dart';
import 'package:t_store/features/store/views/productDetail/widget/TRatingandShare.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/features/store/views/productDetail/widget/add_to_cart.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/size.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({
    super.key,
    required this.product,
    required this.index,
  });

  final Map<String, dynamic> product; // 👈 Changed from List<Map> to Map
  final int index;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  late String selectedImage;

  @override
  void initState() {
    super.initState();
    final List<dynamic> images = widget.product['image'] ?? [];
    selectedImage = images.isNotEmpty ? images[0] : '';
  }

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    final List<dynamic> imageList = widget.product['image'] ?? [];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: selectedImage.isNotEmpty
                              ? Image.asset(selectedImage, fit: BoxFit.contain)
                              : const SizedBox(),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: imageList.length,
                          separatorBuilder: (_, __) =>
                              const SizedBox(width: TSizes.spaceBtwItems),
                          itemBuilder: (_, index) {
                            final image = imageList[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedImage = image;
                                });
                              },
                              child: ProductSliderImages(
                                height: 100,
                                width: 100,
                                image: image,
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),

                  // AppBar overlay
                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: CustomAppBar(
                      showBackArrow: true,
                      actions: [FavouriteButton()],
                    ),
                  ),
                ],
              ),

              // Product details
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: dark ? TColors.dark : TColors.light,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const TRatingandShare(),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      TProductMetaData(
                        product: widget.product,
                        index: widget.index,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),
                      const ProductAttributes(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const AddToCart(),
    );
  }
}
