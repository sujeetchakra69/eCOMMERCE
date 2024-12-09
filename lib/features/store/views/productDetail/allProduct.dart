import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/Layout/Product_gridView.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/common/widgets/components/product_card/HomeProductCard.dart';
import 'package:t_store/features/store/views/productDetail/widget/dropdown_menu.dart';
import 'package:t_store/utility/constants/size.dart';

class Allproduct extends StatelessWidget {
  const Allproduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const   Scaffold(
      appBar:  CustomAppBar(
        showBackArrow: true,
        title: Text('Popular Product'),
      ),
      body: SingleChildScrollView(
        child: All_Product(),
      ),
    );
  }
}

class All_Product extends StatelessWidget {
  const All_Product({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const  EdgeInsets.all(15.0),
      child: Column(
        children: [
         const  DropDownMenu(),
         const SizedBox(height: TSizes.defaultSpace,),
          ProductGridView(
                  itemCount: 5,
                  itemBuilder: (_, index) => const TProductCard()),
        ],
      ),
    );
  }
}

