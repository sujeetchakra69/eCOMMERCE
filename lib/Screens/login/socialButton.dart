
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/Screens/login/login_controller.dart';
import 'package:t_store/utility/constants/images_strings.dart';

class TSocialButton extends StatelessWidget {
  const TSocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final controller=Get.put(LoginController());

    return  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(211, 239, 237, 237),
                      radius: screenWidth * 0.08, // Responsive icon size
                      child: IconButton(
                        onPressed: ()=> controller.googleSignIn,
                        icon: Image(
                          image: const AssetImage(TImages.google),
                          height: screenWidth * 0.08,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(211, 239, 237, 237),
                      radius: screenWidth * 0.08,
                      child: IconButton(
                        onPressed: (){},
                        icon: Image(
                          image: const AssetImage(TImages.appleLogo),
                          height: screenWidth * 0.08,
                        ),
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(211, 239, 237, 237),
                      radius: screenWidth * 0.08,
                      child: IconButton(
                        onPressed: (){},
                        icon: Image(
                          image: const AssetImage(TImages.facebook),
                          height: screenWidth * 0.08,
                        ),
                      ),
                    ),
                  ],
                );
  }
}
