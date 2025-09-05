import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/brand/brandCard.dart';
import 'package:t_store/common/widgets/components/product_card/controller/product_controller.dart';

class FeaturedBrandStore extends StatelessWidget {
  const FeaturedBrandStore({
    super.key,
    required this.itemcount,
  });
  final int itemcount;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(), // Disable scrolling
      itemCount: itemcount,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // 2 items per row
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1 / .5, // Adjust to fit grid items
      ),
      itemBuilder: (_, index) {
        Get.put(ProductController());
        final allProduct = Get.find<ProductController>().allProducts;
        return TBrandCard(
          index: index,
          products: allProduct,
        );
      },
    );
  }
}
