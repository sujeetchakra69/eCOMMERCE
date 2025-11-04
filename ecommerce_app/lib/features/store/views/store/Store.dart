import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:t_store/common/widgets/components/product_card/controller/product_controller.dart';
import 'package:t_store/features/store/views/store/components/storegridView.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/common/widgets/cartIcon.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({super.key,});
 

  @override
  Widget build(BuildContext context) {
    Get.put(ProductController());
    final ProductController productController = Get.find<ProductController>();
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Store',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          TCartIcon(
            onPressed: () {},
          ),
        ],
      ),
      body: GridViewStore(
        products: productController.allProducts,
      ),
    );
  }
}
