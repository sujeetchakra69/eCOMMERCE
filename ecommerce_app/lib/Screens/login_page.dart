import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/Screens/passwordChange.dart';
import 'package:t_store/Screens/signUp.dart';
import 'package:t_store/features/authentication/controllers/login_controller.dart';
import 'package:t_store/navigation.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/constants/text_string.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final controller = Get.put(LoginController());
  bool obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    // Get screen width and height for responsiveness
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

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
                      height: screenHeight *
                          0.1, // Adjust image height based on screen height
                      image: AssetImage(
                        dark ? TImages.lightAppLogo : TImages.darkAppLogo,
                      ),
                    ),
                    Text(
                      TTexts.loginTitle,
                      style:
                          Theme.of(context).textTheme.headlineLarge?.copyWith(
                                fontSize:
                                    screenWidth * 0.08, // Responsive font size
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
                Form(
                  child: Column(
                    children: [
                      // Email
                      TextFormField(
                        controller: _emailController,
                        decoration: const InputDecoration(
                          prefix: Icon(Iconsax.personalcard),
                          labelText: TTexts.email,
                          border: OutlineInputBorder(),
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02), // Responsive space
                      // Password
                      TextFormField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          prefix: const Icon(Iconsax.lock),
                          labelText: TTexts.password,
                          border: const OutlineInputBorder(),
                          suffixIcon: InkWell(
                            child: const Icon(Iconsax.eye_slash),
                            onTap: () {
                              setState(() {
                                obscurePassword = !obscurePassword;
                              });
                            },
                          ),
                        ),
                        obscureText: obscurePassword,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02), // Responsive space
                Row(
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
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
                SizedBox(height: screenHeight * 0.03), // Responsive space
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      controller.login(
                        _emailController.text,
                        _passwordController.text,
                        context,
                      );
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
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                      child: const Text(TTexts.orSignInWith),
                    ),
                    const Expanded(
                      child: Divider(height: 1),
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02), // Responsive space
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () async {
                        final userCredential =
                            await controller.signInWithGoogle();
                        if (userCredential != null) {
                          final user = userCredential.user!;
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text('Welcome, ${user.displayName}!')),
                          );
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const NavigationMenu()),
                          );
                        }
                      },
                      child: CircleAvatar(
                        backgroundColor:
                            const Color.fromARGB(211, 239, 237, 237),
                        radius: screenWidth * 0.08, // Responsive icon size
                        child: Image(
                          image: const AssetImage(TImages.google),
                          height: screenWidth * 0.08,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(211, 239, 237, 237),
                      radius: screenWidth * 0.08,
                      child: Image(
                        image: const AssetImage(TImages.appleLogo),
                        height: screenWidth * 0.08,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(211, 239, 237, 237),
                      radius: screenWidth * 0.08,
                      child: Image(
                        image: const AssetImage(TImages.facebook),
                        height: screenWidth * 0.08,
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
