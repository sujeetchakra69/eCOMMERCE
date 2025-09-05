import 'package:flutter/material.dart';
import 'package:t_store/features/store/views/store/components/storegridView.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/common/widgets/cartIcon.dart';

class StoreScreen extends StatelessWidget {
  StoreScreen({super.key, required this.products, required this.index});
  List<Map<String, dynamic>> products;
  final int index;

  @override
  Widget build(BuildContext context) {
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
        products: products,
        index: index,
      ),
    );
  }
}
