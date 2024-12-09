import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/personalization/controllers/forget_passwordController.dart';
import 'package:t_store/utility/constants/size.dart';
import 'package:t_store/utility/constants/text_string.dart';
import 'package:t_store/utility/validators/validation.dart';

class Passwordchange extends StatelessWidget {
  const Passwordchange({super.key});

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(

      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TTexts.forgetPasswordTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                                    textAlign: TextAlign.left,

                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems,
                ),
                Text(
                  TTexts.forgetPasswordSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                                    textAlign: TextAlign.center,

                ),
                const SizedBox(
                  height: TSizes.spaceBtwItems*3,
                ),
                Form(
                  key: controller.forgetPasswordFormKey,
                  child: TextFormField(
                    controller: controller.email,
                    validator: TValidator.validateEmail,
                    decoration: const InputDecoration(
                        labelText: TTexts.email,
                        prefixIcon: Icon(Iconsax.direct_right)),
                  ),
                ),
                const SizedBox(
                  height: TSizes.spaceBtwSections,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => controller.sendPasswordResetEmail(),
                    child: Text(
                      'Submit',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
