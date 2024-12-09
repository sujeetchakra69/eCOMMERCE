import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/common/widgets/cartIcon.dart';
import 'package:t_store/common/widgets/loader/shimmerEffects.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/features/store/views/Profile/components/cart/my_cart.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/text_string.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UserController());

    return CustomAppBar(
      showBackArrow: false,
      actions: [
        TCartIcon(
          onPressed: () => Get.to(const MyCart()),
        ),
      ],
      title: Column(
        children: [
          Text(
            TTexts.homeAppbarTitle,
            style: Theme.of(context)
                .textTheme
                .titleMedium!
                .apply(color: TColors.white),
          ),
          Obx(() {
            if (controller.profileloading.value) {
              return const TShimmereffects(
                width: 80,
                height: 15,
              );
            } else {
              final fullName = controller.user.value.fullName;
              print('Full Name in UI: $fullName'); // Debugging

              return Text(
                fullName.isNotEmpty ? fullName : 'Guest',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .apply(color: TColors.grey),
              );
            }
          })
        ],
      ),
    );
  }
}
