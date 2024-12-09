import 'package:flutter/material.dart';
import 'package:t_store/features/store/views/store/components/storegridView.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/common/widgets/cartIcon.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

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
      body:const  GridViewStore(),
    );
  }
}
