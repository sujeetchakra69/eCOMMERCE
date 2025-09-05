import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:t_store/common/widgets/components/TCategories.dart';
import 'package:t_store/common/widgets/components/choiceCart.dart';
import 'package:t_store/common/widgets/components/productTitleText/ProductTitleText.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/size.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class ProductAttributes extends StatefulWidget {
  const ProductAttributes({super.key});

  @override
  _ProductAttributesState createState() => _ProductAttributesState();
}

class _ProductAttributesState extends State<ProductAttributes> {


  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);

    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          width: double.infinity,
          decoration: BoxDecoration(
              color: const Color.fromARGB(255, 225, 224, 224),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Variation',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .apply(color: dark ? TColors.light : TColors.dark),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          const ProductTitleText(
                              name: 'Price:',
                              smallSize: false,
                              colors: TColors.black),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            '\$25',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .apply(
                                    color: dark ? TColors.light : TColors.dark,
                                    decoration: TextDecoration.lineThrough),
                          ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            '\$20',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .apply(
                                  color: dark ? TColors.light : TColors.dark,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          const ProductTitleText(
                              name: 'Stock:',
                              smallSize: false,
                              colors: TColors.black),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            'In Stock',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall!
                                .apply(
                                  color: dark ? TColors.light : TColors.dark,
                                ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
              const ProductTitleText(
                name:
                    'This is the description of the product. The max line is 4.',
                smallSize: true,
                colors: Colors.black,
                maxLines: 4,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),

        // Color Selection
        const ChoiceChipWidget(),

        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        Container(
            width: double.infinity,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(8)),
            child: TextButton(
                onPressed: () {},
                child: const Text(
                  'CheckOut',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ))),
        const SizedBox(
          height: TSizes.spaceBtwItems,
        ),

        TCategories(
          title: 'Description',
          onPressed: () {},
          showActionButton: false,
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems/2,
        ),

        const ReadMoreText(
          'The ChoiceChip widget in Flutter is a compact option for creating user-selectable choices in an organized manner. It allows users to select from predefined options such as colors, sizes, or categories, which can enhance the overall user experience in apps. By moving the implementation of ChoiceChip into a separate widget or file, you promote better code organization, making the application easier to maintain and extend. This modular approach ensures that the same component can be reused across different parts of the app, providing consistency in design and functionality.',
          trimLines: 5,
          trimMode: TrimMode.Line,
          trimCollapsedText :'read more',
          trimExpandedText :'show less',
          
        ),
        const Divider(),
        const SizedBox(height: TSizes.defaultSpace/4,),

       const  TCategories(title: 'Reviews',showActionButton: true,),
      ],
    );
  }

}
