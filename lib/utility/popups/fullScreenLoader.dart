import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/common/widgets/loader/animation_loader.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class TFullScreenLoader {
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      builder: (_) {
        // Getting screen dimensions
        final screenHeight = MediaQuery.of(Get.context!).size.height;
        final screenWidth = MediaQuery.of(Get.context!).size.width;
        
        return PopScope(
          canPop: false,
          child: Container(
            color: THelperFunctions.isDarkMode(Get.context!)
                ? TColors.dark
                : TColors.light,
            width: screenWidth,
            height: screenHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  // Loader size as 30% of screen height
                  height: screenHeight * 0.3,
                ),
                TAnimationLoaderWidget(
                  text: text,
                  animation: animation,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void stopLoading() {
    Navigator.of(Get.overlayContext!).pop();
  }
}
