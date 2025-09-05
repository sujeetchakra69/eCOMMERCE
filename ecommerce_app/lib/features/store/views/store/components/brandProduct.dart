import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/features/store/views/productDetail/allProduct.dart';
import 'package:t_store/features/store/views/store/components/FeatureBrand.dart';
import 'package:t_store/utility/constants/size.dart';

class Brandproduct extends StatelessWidget {
  const Brandproduct({super.key});

  @override
  Widget build(BuildContext context) {
    return const  Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text('Nike'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            children: [
              // FeaturedBrandStore widget with itemCount validation
              SizedBox(
                width: double.infinity,
                child: FeaturedBrandStore(itemcount: 1),
              ),
              SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // All_Product widget 
              All_Product(),
            ],
          ),
        ),
      ),
    );
  }
}
