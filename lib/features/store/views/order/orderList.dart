import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/size.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class Orderlist extends StatelessWidget {
  const Orderlist({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return ListView.separated(
      
      itemCount: 10,
      physics:const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (_,__)=>const SizedBox(height: TSizes.spaceBtwItems),
      itemBuilder: (_, index) =>Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
                      color: dark ? TColors.light : TColors.lightgrey,
      
        ),
        child:const Padding(
          padding:  EdgeInsets.all(15.0),
          child:  Column(
            children: [
              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(Iconsax.bag),
                      SizedBox(width: 10,),
                      Column(
                        children: [
                          Text(
                            'Processing',
                            style: TextStyle(color: Colors.blue),
                          ),
                          Text(
                            '01 Sep 2023',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Icon(Iconsax.arrow_right_3),
                ],
              ),
              SizedBox(height: 10,),
              Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Iconsax.tag),
                        SizedBox(width: 10,),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Order',
                              style: TextStyle(color: Color.fromARGB(252, 125, 125, 125),fontSize: 12,),
                            ),
                            Text(
                              'CWT0012',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
      
        
                  Expanded(
                    child: Row(
                      children: [
                        Icon(Iconsax.calendar),
                        SizedBox(width: 10,),
                        Column(crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Shipping Date',
                              style: TextStyle(color: Color.fromARGB(252, 125, 125, 125),fontSize: 12,),
                            ),
                            Text(
                              '09 Sep 2023',
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
      
      
      
                  
                ],
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
