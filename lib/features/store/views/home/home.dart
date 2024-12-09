import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/styles/curved_edges_widget.dart';
import 'package:t_store/common/widgets/Layout/Product_gridView.dart';
import 'package:t_store/common/widgets/components/TCategories.dart';
import 'package:t_store/common/widgets/components/TImageSlider.dart';
import 'package:t_store/common/widgets/components/Tslider.dart';
import 'package:t_store/common/widgets/components/product_card/HomeProductCard.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const curved_edges_widget(),

            //Carousel Slider

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: TSizes.sm),
              child: Column(
                children: [
                  CarouselSlider(
                    items: const [
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: sliderItem(name: TImages.promoBanner1),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: sliderItem(name: TImages.promoBanner2),
                      ),
                      Padding(
                        padding: EdgeInsets.all(2.0),
                        child: sliderItem(name: TImages.promoBanner3),
                      ),
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
                    onPressed: () {Get.to(const Allproduct());},
                    showActionButton: true,
                  ),
                  //gridview
                  ProductGridView(
                      itemCount: 10,
                      itemBuilder: (_, index) => const TProductCard()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class sliderItem extends StatelessWidget {
  const sliderItem({
    super.key,
    required this.name,
  });
  final String name;

  @override
  Widget build(BuildContext context) {
    return TSlider(
      imageUrl: name,
      backgroundColor: Colors.white,
      border: null,
    );
  }
}
