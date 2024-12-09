import 'package:flutter/material.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/common/widgets/components/singleCardHorizontal.dart';
import 'package:t_store/utility/constants/images_strings.dart';

class Subcategories extends StatelessWidget {
  const Subcategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text('Sports'),
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
            // Horizontal scrollable list of products
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: SizedBox(
                height: 150, // Adjust height to fit Singlecardhorizontal widget size
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  itemCount: 5, // Change this to the number of products
                  itemBuilder: (context, index) {
                    return const Padding(
                      padding: EdgeInsets.only(right: 10.0),
                      child: Singlecardhorizontal(),
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
