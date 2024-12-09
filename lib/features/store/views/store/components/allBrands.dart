import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/features/store/views/store/components/FeatureBrand.dart';

class Allbrands extends StatelessWidget {
  const Allbrands({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:  CustomAppBar(
        showBackArrow: true,
        title: Text('All Brands'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
               FeaturedBrandStore(
                              itemcount: 10,
                            ),
            ],
          ),
        ),
      ),
    );
  }
}
