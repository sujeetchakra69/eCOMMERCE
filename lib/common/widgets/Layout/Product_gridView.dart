
import 'package:flutter/material.dart';
import 'package:t_store/utility/constants/size.dart';

class ProductGridView extends StatelessWidget {
  const ProductGridView({
    super.key, required this.itemCount, required this.itemBuilder,
  });
  final int itemCount;
  final Widget? Function (BuildContext, int ) itemBuilder; 


  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: itemCount,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate:
        const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.5,
          mainAxisSpacing: TSizes.gridViewSpacing,
          crossAxisSpacing: TSizes.gridViewSpacing,
          mainAxisExtent: 300,
        ),
        itemBuilder: itemBuilder);
  }
}