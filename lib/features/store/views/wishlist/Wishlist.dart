import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/Layout/Product_gridView.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/common/widgets/cartIcon.dart';
import 'package:t_store/common/widgets/components/product_card/HomeProductCard.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/size.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
        backgroundColor: dark ? TColors.dark : TColors.white,
        appBar:  CustomAppBar(
            showBackArrow: true,
            title: Text('Wishlist',style: Theme.of(context).textTheme.headlineLarge,),
            actions: [
              TCartIcon(onPressed: (){}),
            ]),

        body:  SingleChildScrollView(
          child: Padding(padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              ProductGridView(itemCount: 4, itemBuilder: (_,index)=>const TProductCard(),)
            ],
          ),),
        ),    
            
            
            
    );
  }
}
