import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/features/store/views/store/components/featureBrand.dart';

class Allbrands extends StatelessWidget {
  Allbrands({
    super.key,
    required this.products,
  });
  List<Map<String, dynamic>> products;
  @override
  Widget build(BuildContext context) {
    debugger();
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
                products: products,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
