import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/Screens/login_page.dart';
import 'package:t_store/features/authentication/controllers/login_controller.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/constants/size.dart';
import 'package:t_store/utility/constants/text_string.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen(
      {super.key, required this.email, required this.password});
  final String email;
  final String password;

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
                image: const AssetImage(TImages.deliveredEmailIllustration),
                width: THelperFunctions.screenWidth() * .8,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                TTexts.confirmEmail,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                email,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              Text(
                TTexts.confirmEmailSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems * 4,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.put(LoginController())
                        .registerUser(email, password),
                    child: const Text('Continue')),
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Resend Email',
                    style: Theme.of(context).textTheme.labelSmall,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
