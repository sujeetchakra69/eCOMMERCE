
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/common/widgets/cartIcon.dart';
import 'package:t_store/features/store/views/Profile/components/cart/my_cart.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/text_string.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      showBackArrow: false,
      actions:  [
         TCartIcon(onPressed: ()=> Get.to(const MyCart()),
         ),
      ],
      title: Column(
        children: [
          Text(TTexts.homeAppbarTitle,
              style:
                  Theme.of(context).textTheme.titleMedium!.apply(color: TColors.white)),
          Text(TTexts.homeAppbarSubTitle,
              style:
                  Theme.of(context).textTheme.titleLarge!.apply(color:TColors.grey),)
        ],
      ),
    );
  }
}