import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/Screens/login/login_page.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variables
  final PageController pageController = PageController();
  Rx<int> currentPageIndex = 0.obs;

  void updatePageIndicator(int index) {
    currentPageIndex.value = index;
  }

  void dotNavigationClick(int index) {
    currentPageIndex.value = index;
    pageController.jumpToPage(index); // Change to jumpToPage for smoother transitions
  }

  void nextPage() {
    if (currentPageIndex.value == 2) {
      final storage=GetStorage();
      storage.write('isFirstTime', false);
      // Navigate to LoginPage when the last page is reached
      Get.offAll(()=> const LoginPage());
    } else {
      int nextPage = currentPageIndex.value + 1;
      pageController.animateToPage(
        nextPage,
        duration: const Duration(milliseconds: 300), // Consistent duration
        curve: Curves.easeIn,
      );
    }
  }

  void skipPage() {
    pageController.animateToPage(
      2,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    currentPageIndex.value = 2; // Update the index to skip to the last page
  }
}
