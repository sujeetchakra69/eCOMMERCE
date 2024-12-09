import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/Screens/login/login_page.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/constants/size.dart';
import 'package:t_store/utility/constants/text_string.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class Successscreen extends StatelessWidget {
  const Successscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginPage()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Image(
                image: const AssetImage(TImages.staticSuccessIllustration),
                width: THelperFunctions.screenWidth() * .8,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                TTexts.yourAccountCreatedTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              
              
              Text(
                TTexts.yourAccountCreatedSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems*4,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: ()=> Get.to(()=>const LoginPage()),
                    child: const Text('Continue')),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
