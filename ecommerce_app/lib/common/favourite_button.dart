import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/store/controllers/Profile_controller.dart';

class FavouriteButton extends StatelessWidget {
  const FavouriteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return GestureDetector(
      onTap: () {
        controller.toggleLike();
      },
      child: Obx(() => Icon(
            controller.liked.value ? Iconsax.heart5 : Iconsax.heart,
            color: controller.liked.value ? Colors.red : null,
            size: 30,
          )),
    );
  }
}
