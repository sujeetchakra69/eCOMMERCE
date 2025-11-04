import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/tadBar.dart';
import 'package:t_store/common/widgets/CustomSearch.dart';
import 'package:t_store/common/widgets/components/TCategories.dart';
import 'package:t_store/features/store/views/store/components/featureBrand.dart';
import 'package:t_store/features/store/views/store/components/allBrands.dart';
import 'package:t_store/features/store/views/store/components/tabBar.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/size.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class GridViewStore extends StatelessWidget {
  GridViewStore({
    super.key,
    required this.products,
  });
  List<Map<String, dynamic>> products;

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                pinned: true,
                floating: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                automaticallyImplyLeading: false, // Removes the back icon
                expandedHeight: 500, // Adjust height for your layout
                flexibleSpace: FlexibleSpaceBar(
                  background: Padding(
                    padding: const EdgeInsets.only(
                      top: TSizes.spaceBtwSections,
                      left: TSizes.spaceBtwItems,
                      right: TSizes.spaceBtwItems,
                    ),
                    child: Column(
                      children: [
                        const CustomSearch(),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        TCategories(
                          title: 'Feature Brands',
                          onPressed: () {
                            Get.to(Allbrands(
                              products: products,
                            ));
                          },
                        ),
                        const SizedBox(height: TSizes.spaceBtwSections),
                        // GridView within SliverAppBar
                        Expanded(
                          child: FeaturedBrandStore(
                            products: products,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // TabsBar
                bottom: const TTabBar(
                  tab: [
                    Tab(child: Text('Sports')),
                    Tab(child: Text('Furniture')),
                    Tab(child: Text('Electronics')),
                    Tab(child: Text('Clothes')),
                    Tab(child: Text('Cosmetics')),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [
              //sports tab
              Tab_Bar(),
              //furniture tab
              Center(child: Text('Furniture')),
              //Electronics tab

              Center(child: Text('Electronics')),
              //Clothes tab

              Center(child: Text('Clothes')),
              //furnCosmeticsiture tab

              Center(child: Text('Cosmetics')),
            ],
          ),
        ),
      ),
    );
  }
}
