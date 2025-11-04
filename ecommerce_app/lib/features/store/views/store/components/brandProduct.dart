import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/features/store/views/productDetail/allProduct.dart';
import 'package:t_store/features/store/views/store/components/featureBrand.dart';
import 'package:t_store/utility/constants/size.dart';

class Brandproduct extends StatelessWidget {
  const Brandproduct({super.key, required this.products});
  final List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text('aaaa'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              // FeaturedBrandStore widget with itemCount validation
              SizedBox(
                width: double.infinity,
                child: FeaturedBrandStore(products: products),
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              // All_Product widget
              const AllProduct(
                products: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
