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
  ProductDetail({super.key, required this.firstProducts, required this.index});

  List<Map<String, dynamic>> firstProducts;
  final int index;

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  // Store the selected image
  late String selectedImage;

  @override
  void initState() {
    super.initState();
    selectedImage = widget.firstProducts[widget.index]["product"]['name'];
  }

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    final products = Get.find<ProductController>().allProducts;

    // List of images for the horizontal slider
    final List<String> imageList =
        products[widget.index][products][widget.index]["image"];

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Product image with overlay
              Stack(
                children: [
                  // Main product image and horizontal slider
                  Column(
                    children: [
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 16.0),
                          child: Image.asset(
                            selectedImage, // Display the selected image
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: imageList.length,
                          separatorBuilder: (_, __) => const SizedBox(
                            width: TSizes.spaceBtwItems,
                          ),
                          itemBuilder: (_, index) {
                            final image = imageList[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedImage =
                                      image; // Update selected image
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

                  // Custom AppBar overlayed
                  const Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: CustomAppBar(
                      showBackArrow: true,
                      actions: [
                        FavouriteButton(),
                      ],
                    ),
                  ),
                ],
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
                child: Padding(
                  padding: const EdgeInsets.all(TSizes.defaultSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Rating and share
                      const TRatingandShare(),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      // Price, status, brand
                      TProductMetaData(
                        firstProducts: widget.firstProducts,
                        index: widget.index,
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      // Product attributes
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
