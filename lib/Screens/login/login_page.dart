import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/Screens/SignUp.dart';
import 'package:t_store/Screens/login/login_controller.dart';
import 'package:t_store/Screens/login/loginform.dart';
import 'package:t_store/Screens/login/socialButton.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/constants/text_string.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    // Get screen width and height for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isPasswordVisible = false.obs;

    // Initialize the LoginController
    final loginController = Get.put(LoginController());

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: screenHeight,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 3, 93, 167),
                Color.fromARGB(255, 7, 114, 202),
                Color.fromARGB(255, 4, 124, 221),
                Color.fromARGB(255, 139, 187, 227),
                Color.fromARGB(255, 180, 179, 179),
              ],
              begin: Alignment.bottomRight,
              end: Alignment.centerLeft,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.05,
              horizontal: screenWidth * 0.08,
            ),
            child: Column(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image(
                      height: screenHeight * 0.2, // Adjust image height based on screen height
                      image: AssetImage(
                        dark ? TImages.lightAppLogo : TImages.darkAppLogo,
                      ),
                    ),
                    Text(
                      TTexts.loginTitle,
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                            fontSize: screenWidth * 0.08, // Responsive font size
                          ),
                    ),
                    SizedBox(height: screenHeight * 0.01), // Responsive spacing
                    Text(
                      TTexts.loginSubTitle,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.03), // Responsive space
                loginForm(
                  screenHeight: screenHeight,
                  ispasswordvisible: isPasswordVisible,
                  emailController: loginController.email,
                  passwordController: loginController.password,
                ),
                SizedBox(height: screenHeight * 0.02), // Responsive space
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Trigger login function
                      await loginController.emailAndPasswordSignIn();
                    },
                    child: const Text(TTexts.signIn),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02), // Responsive space
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Get.to(() => const SignUp()),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[100],
                      foregroundColor: Colors.black,
                      side: const BorderSide(color: Colors.grey),
                    ),
                    child: const Text(TTexts.createAccount),
                  ),
                ),
                SizedBox(height: screenHeight * 0.04), // Responsive space
                Row(
                  children: [
                    const Expanded(
                      child: Divider(height: 1),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                      child: const Text(TTexts.orSignInWith),
                    ),
                    const Expanded(
                      child: Divider(height: 1),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02), // Responsive space

                const TSocialButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
