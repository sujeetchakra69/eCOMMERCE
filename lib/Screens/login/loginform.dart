import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/Screens/Passwordchange.dart';
import 'package:t_store/Screens/login/login_controller.dart';
import 'package:t_store/utility/constants/text_string.dart';
import 'package:t_store/utility/validators/validation.dart';

class loginForm extends StatelessWidget {
  const loginForm({
    super.key,
    required this.screenHeight,
    required this.ispasswordvisible, required TextEditingController emailController, required TextEditingController passwordController,
  });

  final double screenHeight;
  final RxBool ispasswordvisible;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Column(
        children: [
          // Email
          TextFormField(
            controller: controller.email,
            validator: (value) => TValidator.validateEmail(value),
            decoration: const InputDecoration(
              prefix: Icon(Iconsax.personalcard),
              labelText: TTexts.email,
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: screenHeight * 0.01), // Responsive space
          // Password
          Obx(
            () => TextFormField(
              controller: controller.password,
              validator: (value) =>
                  TValidator.validateEmptyText('Password', value),
              decoration: InputDecoration(
                prefix: const Icon(Iconsax.lock),
                labelText: TTexts.password,
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  icon: Icon(ispasswordvisible.value
                      ? Iconsax.eye
                      : Iconsax.eye_slash),
                  onPressed: () =>
                      ispasswordvisible.value = !ispasswordvisible.value,
                ),
              ),
              obscureText: !ispasswordvisible.value,
            ),
          ),

          //Remember me
          Row(
            children: [
              // Remember me
              Row(
                children: [
                  Obx(
                    ()=> Checkbox(
                      value: controller.rememberMe.value,
                      onChanged: (value) => controller.rememberMe.value=!controller.rememberMe.value,
                    ),
                  ),
                  Text(
                    TTexts.rememberMe,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
              const Spacer(),
              TextButton(
                onPressed: () => Get.to(() => const Passwordchange()),
                child: const Text(TTexts.forgetPassword),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
