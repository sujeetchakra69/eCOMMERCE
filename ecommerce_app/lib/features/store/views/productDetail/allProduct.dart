import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/Layout/Product_gridView.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/common/widgets/components/product_card/controller/product_controller.dart';
import 'package:t_store/common/widgets/components/product_card/product_card.dart';
import 'package:t_store/utility/constants/size.dart';

class Allproduct extends StatelessWidget {
  const Allproduct({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    final allProducts = Get.find<ProductController>().allProducts;
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text('Popular Product'),
      ),
      body: SingleChildScrollView(
        child: AllProduct(
          products: allProducts,
        ),
      ),
    );
  }
}

class AllProduct extends StatefulWidget {
  final List<Map<String, dynamic>> products;

  const AllProduct({
    super.key,
    required this.products,
  });

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  String selectedSort = 'None';
  late List<Map<String, dynamic>> sortedProducts;

  @override
  void initState() {
    super.initState();
    sortedProducts = List.from(widget.products); // copy initial list
  }

  void sortProducts(String sortBy) {
    setState(() {
      selectedSort = sortBy;
      if (sortBy == 'Highest') {
        sortedProducts.sort((a, b) => (b['product']?['price'] ?? 0)
            .compareTo(a['product']?['price'] ?? 0));
        log('sortedProducts: ${sortedProducts.length}');
      } else if (sortBy == 'Lowest') {
        sortedProducts.sort((a, b) => (a['product']?['price'] ?? 0)
            .compareTo(b['product']?['price'] ?? 0));
      } else {
        sortedProducts = List.from(widget.products); // reset
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton<String>(
                value: selectedSort,
                items: <String>['None', 'Highest', 'Lowest']
                    .map((value) => DropdownMenuItem(
                          value: value,
                          child: Text(value),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value != null) sortProducts(value);
                },
              ),
            ],
          ),
          const SizedBox(height: TSizes.defaultSpace),
          ProductGridView(
            itemCount: sortedProducts.length,
            itemBuilder: (_, index) => TProductCard(
              allProducts: sortedProducts,
              index: index,
            ),
          ),
        ],
      ),
    );
  }
}
