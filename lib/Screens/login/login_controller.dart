import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store/data/repositories/authentication_reposirtory.dart';
import 'package:t_store/features/personalization/controllers/user_controller.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/formatters/network_manager.dart';
import 'package:t_store/utility/popups/fullScreenLoader.dart';
import 'package:t_store/utility/popups/loaders.dart';

class LoginController extends GetxController {
  // Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();

  final email = TextEditingController();
  final password = TextEditingController();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    email.text = localStorage.read('Remember Me Email') ?? '';
    password.text = localStorage.read('Remember me Password') ?? '';
    super.onInit();
  }

  // Method for signing in with email and password
  Future<void> emailAndPasswordSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Loading...', TImages.staticSuccessIllustration);

      // Check internet connection
      final bool isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
          title: 'No Internet Connection',
          message: 'Please check your internet and try again.',
        );
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Save data if "Remember me" is selected
      if (rememberMe.value) {
        localStorage.write('RememberMeEmail', email.text.trim());
        localStorage.write('RememberMePassword', password.text.trim());
      }

      // Attempt to log in using Firebase
      final userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: email.text.trim(), password: password.text.trim());

      // Stop the loader after successful login
      TFullScreenLoader.stopLoading();

      // Check if user exists
      if (userCredential.user == null) {
        TLoaders.errorSnackBar(
          title: 'Login Failed',
          message: 'User not found. Please check your email or register.',
        );
        return;
      }

      // Check if the email is verified
      if (!userCredential.user!.emailVerified) {
        TLoaders.errorSnackBar(
          title: 'Email Not Verified',
          message: 'Please verify your email before logging in.',
        );
        return;
      }

      // Redirect user after successful login
      AuthenticationRepository.instance.screenRedirect();
    } on FirebaseAuthException catch (e) {
      // Handle Firebase Auth errors
      TFullScreenLoader.stopLoading();
      if (e.code == 'user-not-found') {
        TLoaders.errorSnackBar(
          title: 'User Not Found',
          message: 'No user found with this email.',
        );
      } else if (e.code == 'wrong-password') {
        TLoaders.errorSnackBar(
          title: 'Wrong Password',
          message: 'Incorrect password. Please try again.',
        );
      } else {
        TLoaders.errorSnackBar(
          title: 'Error',
          message: 'Something went wrong: ${e.message}',
        );
      }
    } catch (e) {
      // General error handling
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: 'Something went wrong...',
        message: e.toString(),
      );
    }
  }

  // Google sign-in authentication
  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          'Logging you in...', TImages.successfulPaymentIcon);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        return;
      }

      // Perform Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save user record after Google sign-in
      final userController = UserController();
      await userController.saveUserRecord(userCredentials);

      // Stop the loading spinner after Google login
      TFullScreenLoader.stopLoading();

      // Redirect the user after successful login
      AuthenticationRepository.instance.screenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: 'Oh Snap',
        message: 'Something went wrong: ${e.toString()}',
      );
    }
  }
}
