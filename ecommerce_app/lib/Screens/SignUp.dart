import 'dart:developer';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/Screens/verificationScreen.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/constants/size.dart';
import 'package:t_store/utility/constants/text_string.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final bool dark = Theme.of(context).brightness == Brightness.dark;
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dark ? TColors.white : TColors.grey,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
          Color.fromARGB(255, 3, 93, 167),
          Color.fromARGB(255, 85, 161, 236),
          Color.fromARGB(255, 169, 209, 241),
          Color.fromARGB(255, 178, 211, 237),
          Colors.white
        ], begin: Alignment.bottomRight, end: Alignment.centerLeft)),
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
                Form(
                  child: Column(
                    children: [
                      // Row for First and Last Name
                      const Row(
                        children: [
                          Expanded(
                            child: CustomTextFormField(
                              labelText: TTexts.firstName,
                              iconData: Iconsax.user,
                            ),
                          ),
                          SizedBox(width: TSizes.spaceBtwInputFields),
                          Expanded(
                            child: CustomTextFormField(
                              labelText: TTexts.lastName,
                              iconData: Iconsax.user,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: TSizes.spaceBtwInputFields),

                      // Username
                      const CustomTextFormField(
                        labelText: TTexts.username,
                        iconData: Iconsax.user,
                      ),
                      // TextFormField(
                      //   decoration: const InputDecoration(
                      //     prefixIcon: Icon(Iconsax.user),
                      //     labelText: TTexts.username,
                      //     border: OutlineInputBorder(),
                      //   ),
                      // ),
                      const SizedBox(height: TSizes.spaceBtwInputFields),

                      // Email
                      CustomTextFormField(
                        labelText: TTexts.email,
                        iconData: Iconsax.message,
                        controller: emailController,
                      ),
                      // TextFormField(
                      //   controller: emailController,
                      //   expands: false,
                      //   decoration: const InputDecoration(
                      //     prefixIcon: Icon(Iconsax.message),
                      //     labelText: TTexts.email,
                      //     border: OutlineInputBorder(),
                      //   ),
                      // ),
                      const SizedBox(height: TSizes.spaceBtwInputFields),

                      // Password
                      CustomTextFormField(
                        labelText: TTexts.password,
                        iconData: Iconsax.lock,
                        controller: passwordController,
                      ),
                      // TextFormField(
                      //   controller: passwordController,
                      //   decoration: const InputDecoration(
                      //     prefixIcon: Icon(Iconsax.lock),
                      //     labelText: TTexts.password,
                      //     suffixIcon: Icon(Iconsax.eye_slash),
                      //     border: OutlineInputBorder(),
                      //   ),
                      //   obscureText: true,
                      // ),
                      const SizedBox(height: TSizes.spaceBtwInputFields),

                      // Phone Number
                      const CustomTextFormField(
                        labelText: TTexts.phoneNo,
                        iconData: Iconsax.call,
                        phone: true,
                      ),
                      // TextFormField(
                      //   keyboardType: TextInputType.phone,
                      //   decoration: const InputDecoration(
                      //     prefixIcon: Icon(Iconsax.call),
                      //     labelText: TTexts.phoneNo,
                      //     border: OutlineInputBorder(),
                      //   ),
                      // ),
                      const SizedBox(height: TSizes.spaceBtwInputFields),

                      // Checkbox with Terms and Conditions
                      Row(
                        children: [
                          SizedBox(
                            height: 24,
                            width: 24,
                            child:
                                Checkbox(value: false, onChanged: (value) {}),
                          ),
                          Expanded(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: '${TTexts.iAgreeTo} ',
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  TextSpan(
                                    text: '${TTexts.privacyPolicy} ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .apply(
                                          color: dark
                                              ? TColors.white
                                              : TColors.primary,
                                          decoration: TextDecoration.underline,
                                          decorationColor: dark
                                              ? TColors.light
                                              : TColors.dark,
                                        ),
                                  ),
                                  TextSpan(
                                    text: TTexts.and,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                  TextSpan(
                                    text: TTexts.termsOfUse,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .apply(
                                          color: dark
                                              ? TColors.white
                                              : TColors.primary,
                                          decoration: TextDecoration.underline,
                                          decorationColor: dark
                                              ? TColors.light
                                              : TColors.dark,
                                        ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: TSizes.spaceBtwItems),

                      // Create Account Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () async {
                            debugger();
                            // final success = await FirebaseAuth.instance
                            //     .createUserWithEmailAndPassword(
                            //   email: emailController.text,
                            //   password: passwordController.text,
                            // );
                            
                              Get.to(() =>  VerificationScreen(
                                email: emailController.text,
                                password: passwordController.text
                              ));
                            
                          },
                          //   onPressed: () =>
                          //       Get.to(() => const VerificationScreen()),
                          child: const Text(TTexts.createAccount),
                        ),
                      ),
                    ],
                  ),
                ),

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

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.labelText,
    required this.iconData,
    this.phone = false,
    this.controller,
  });

  final String labelText;
  final IconData iconData;
  final bool phone;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(iconData),
        labelText: labelText,
        border: const OutlineInputBorder(),
      ),
      controller: controller,
      keyboardType: phone ? TextInputType.phone : TextInputType.text,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter the details';
        }
        return null;
      },
    );
  }
}
