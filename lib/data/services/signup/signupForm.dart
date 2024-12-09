import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/data/services/signup/signupController.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/size.dart';
import 'package:t_store/utility/constants/text_string.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';
import 'package:t_store/utility/validators/validation.dart';

class signupForm extends StatelessWidget {
  const signupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = SignupController.instance;
    return Form(
      key: controller.signupFormkey,
      child: Column(
        children: [
          // Row for First and Last Name
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: controller.firstname,
                  validator: (value) =>
                      TValidator.validateEmptyText('FirstName', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: TTexts.firstName,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: TSizes.spaceBtwInputFields),
              Expanded(
                child: TextFormField(
                  controller: controller.lastname,
                  validator: (value) =>
                      TValidator.validateEmptyText('lastname', value),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: TTexts.lastName,
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Username
          TextFormField(
            controller: controller.username,
            validator: (value) =>
                TValidator.validateEmptyText('username', value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.user),
              labelText: TTexts.username,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            expands: false,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.message),
              labelText: TTexts.email,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) => TValidator.validatePassword(value),
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.lock),
                labelText: TTexts.password,
                suffixIcon: IconButton(
                  onPressed: () => controller.hidepassword.value =
                      !controller.hidepassword.value,
                  icon: Icon(controller.hidepassword.value
                      ? Iconsax.eye_slash
                      : Iconsax.eye),
                ),
                border: const OutlineInputBorder(),
              ),
              obscureText: controller.hidepassword.value,
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Phone Number
          TextFormField(
            controller: controller.phonenumber,
            validator: (value) => TValidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.call),
              labelText: TTexts.phoneNo,
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: TSizes.spaceBtwInputFields),

          // Checkbox with Terms and Conditions
          Row(
            children: [
              SizedBox(
                height: 24,
                width: 24,
                child: Obx(
                  () => Checkbox(
                      value: controller.privacypolicy.value,
                      onChanged: (value) => controller.privacypolicy.value =
                          !controller.privacypolicy.value),
                          
                ),
              ),
              Expanded(
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${TTexts.iAgreeTo} ',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: '${TTexts.privacyPolicy} ',
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: dark ? TColors.white : TColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  dark ? TColors.light : TColors.dark,
                            ),
                      ),
                      TextSpan(
                        text: TTexts.and,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      TextSpan(
                        text: TTexts.termsOfUse,
                        style: Theme.of(context).textTheme.bodyMedium!.apply(
                              color: dark ? TColors.white : TColors.primary,
                              decoration: TextDecoration.underline,
                              decorationColor:
                                  dark ? TColors.light : TColors.dark,
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
              onPressed: () => controller.signup(),
              child: const Text(TTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
