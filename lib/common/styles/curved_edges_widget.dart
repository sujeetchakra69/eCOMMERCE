
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/Screens/pages/subCategories.dart';
import 'package:t_store/common/widgets/CustomSearch.dart';
import 'package:t_store/common/widgets/common_shapes.dart';
import 'package:t_store/common/widgets/components/TCategories.dart';
import 'package:t_store/common/widgets/components/TImageText.dart';
import 'package:t_store/common/widgets/curvededges.dart';
import 'package:t_store/features/store/views/home/Homeappbar.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/constants/size.dart';

class curved_edges_widget extends StatelessWidget {
  const curved_edges_widget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurveEdges(),
      child: Container(
        color: const Color.fromARGB(255, 46, 92, 240),
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: -150,
                right: -250,
                child: TCircleContainer(
                  showBorder: true,
                  width: 400,
                  height: 300,
                  backgroundColor: TColors.textWhite.withOpacity(.1),
                ),
              ),
              Positioned(
                width: 400,
                height: 300,
                top: 100,
                right: -300,
                child: TCircleContainer(
                  showBorder: true,
                  backgroundColor: TColors.textWhite.withOpacity(.1),
                ),
              ),
              Column(
                children: [
                  const HomeAppBar(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const CustomSearch(),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TCategories(
                    title: 'Popular Categories',
                    showActionButton: false,
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  GestureDetector(
                    onTap: ()=> Get.to (const Subcategories()),
                    child: SizedBox(
                      height: 90,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: TSizes.defaultSpace),
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (_, index) {
                          return const VerticalImageText(
                            image: TImages.shoeIcon,
                            title: 'Shoe',
                            textColor: Colors.white,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}