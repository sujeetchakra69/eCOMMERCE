import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:t_store/features/authentication/controllers/onboarding_controller.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/constants/size.dart';
import 'package:t_store/utility/device/device_utility.dart';
import '../../../utility/constants/text_string.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Initialize the controller
    final OnBoardingController controller = Get.put(OnBoardingController());

    return Scaffold(
      body: Stack(
        children: [
          // PageView for onboarding pages
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                image: TImages.onBoardingImage1,
                title: TTexts.onBoardingTitle1,
                subtitile: TTexts.onBoardingSubTitle1,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage2,
                title: TTexts.onBoardingTitle2,
                subtitile: TTexts.onBoardingSubTitle2,
              ),
              OnBoardingPage(
                image: TImages.onBoardingImage3,
                title: TTexts.onBoardingTitle3,
                subtitile: TTexts.onBoardingSubTitle3,
              ),
            ],
          ),

          // Skip button
          Positioned(
            top: TdeviceUtils.getAppBarHeight(),
            right: TSizes.defaultSpace,
            child: TextButton(
              onPressed: () {
                controller.skipPage();
              },
              child: const Text('Skip'),
            ),
          ),

          // Dot Navigator with SmoothPageIndicator
          Positioned(
            bottom: TdeviceUtils.getBottomNavigationBarHeight() + 25,
            left: TSizes.defaultSpace,
            child: SmoothPageIndicator(
                onDotClicked: controller.dotNavigationClick,
                controller: controller.pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                  activeDotColor: TColors.dark,
                  dotHeight: 6,
                ),
              )
            
          ),

          // Circular Next Button
          Positioned(
            right: TSizes.defaultSpace,
            bottom: TdeviceUtils.getBottomNavigationBarHeight(),
            child: IconButton(
              onPressed: () {
                controller.nextPage();
              },
              icon: const Icon(Iconsax.arrow_right4),
              iconSize: 50,
            ),
          ),
        ],
      ),
    );
  }
}

// OnboardingPage widget
class OnBoardingPage extends StatelessWidget {
  final String image, title, subtitile;

  const OnBoardingPage({
    super.key,
    required this.image,
    required this.title,
    required this.subtitile,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(TSizes.defaultSpace),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            width: MediaQuery.of(context).size.width * .6,
            height: MediaQuery.of(context).size.height * .5,
            image: AssetImage(image),
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: TSizes.spaceBtwItems),
          Text(
            subtitile,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
