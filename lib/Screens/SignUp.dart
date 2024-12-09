import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/data/services/signup/signupController.dart';
import 'package:t_store/data/services/signup/signupForm.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/constants/size.dart';
import 'package:t_store/utility/constants/text_string.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
        Get.put(SignupController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark? TColors.white: TColors.grey,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color.fromARGB(255, 3, 93, 167),Color.fromARGB(255, 85, 161, 236),Color.fromARGB(255, 169, 209, 241),Color.fromARGB(255, 178, 211, 237),Colors.white],
            begin: Alignment.bottomRight,
            end: Alignment.centerLeft
            )
          ),
        child: Padding(
          padding: const EdgeInsets.all(TSizes.iconSm),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  TTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(
                  height: TSizes.defaultSpace,
                ),
                const signupForm(),
        
                // Divider with Text (or sign up with)
                const SizedBox(height: TSizes.spaceBtwItems * 4),
                const Row(
                  children: [
                    Expanded(
                      child: Divider(
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(TTexts.orSignUpWith),
                    ),
                    Expanded(
                      child: Divider(
                        height: 1,
                      ),
                    ),
                  ],
                ),
        
                const SizedBox(height: TSizes.spaceBtwItems * 3),
        
                // Social Media Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(211, 239, 237, 237),
                      child: Image.asset(
                        TImages.google,
                        height: TSizes.iconLg,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(211, 239, 237, 237),
                      child: Image.asset(
                        TImages.appleLogo,
                        height: TSizes.iconLg,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(211, 239, 237, 237),
                      child: Image.asset(
                        TImages.facebook,
                        height: TSizes.iconLg,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
