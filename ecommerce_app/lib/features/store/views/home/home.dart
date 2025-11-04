import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/styles/curved_edges_widget.dart';
import 'package:t_store/common/widgets/Layout/Product_gridView.dart';
import 'package:t_store/common/widgets/components/TCategories.dart';
import 'package:t_store/common/widgets/components/TImageSlider.dart';
import 'package:t_store/common/widgets/components/Tslider.dart';
import 'package:t_store/common/widgets/components/product_card/controller/product_controller.dart';
import 'package:t_store/common/widgets/components/product_card/product_card.dart';
import 'package:t_store/features/store/views/productDetail/allProduct.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/constants/size.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  ProductController productController = Get.put(ProductController());
  late final firstProduct = productController.firstProducts;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const CurvedEdgesWidget(),

            //Carousel Slider

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm - 6),
              child: Column(
                children: [
                  CarouselSlider(
                    items: const [
                      SliderItem(name: TImages.promoBanner1),
                      SliderItem(name: TImages.promoBanner2),
                      SliderItem(name: TImages.promoBanner3),
                    ],
                    options: CarouselOptions(
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ImageSlider(currentIndex: _currentIndex),
                  const SizedBox(height: TSizes.spaceBtwItems),

                  TCategories(
                    title: 'Popular Product',
                    onPressed: () {
                      Get.to(() => const Allproduct());
                    },
                    showActionButton: true,
                  ),
                  //gridview
                  ProductGridView(
                    itemBuilder: (_, index) {
                      if (firstProduct.isEmpty) {
                        return const SizedBox.shrink(); // prevent null crash
                      }

                      return TProductCard(
                        allProducts: firstProduct,
                        index: index,
                      );
                    },
                    itemCount: firstProduct.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliderItem extends StatelessWidget {
  const SliderItem({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: TSlider(
        imageUrl: name,
        backgroundColor: Colors.white,
        border: null,
      ),
    );
  }
}
