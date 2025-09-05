import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/features/store/views/store/components/FeatureBrand.dart';

class Allbrands extends StatelessWidget {
  Allbrands({super.key, required this.products, required this.index});
  List<Map<String, dynamic>> products;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text('All Brands'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              FeaturedBrandStore(
                itemcount: products.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
