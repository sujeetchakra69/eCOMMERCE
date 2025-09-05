import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/common/widgets/components/singleCardHorizontal.dart';
import 'package:t_store/utility/constants/images_strings.dart';

class Subcategories extends StatelessWidget {
  const Subcategories({super.key, required this.brand, required this.index});
  final List<Map<String, dynamic>> brand;
  final int index;

  @override
  Widget build(BuildContext context) {
    final currentBrand = brand[index];

    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(currentBrand['brand']),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  TImages.banner2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: SizedBox(
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: currentBrand["products"].length,
                  itemBuilder: (context, index) {
                    final product = currentBrand["products"][index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Singlecardhorizontal(
                        product: product,
                        brand: currentBrand["brand"],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
