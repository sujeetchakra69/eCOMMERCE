import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:t_store/Screens/forgetPassword.dart';
import 'package:t_store/data/repositories/authentication_reposirtory.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/formatters/network_manager.dart';
import 'package:t_store/utility/popups/fullScreenLoader.dart';
import 'package:t_store/utility/popups/loaders.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordFormKey = GlobalKey<FormState>();

  // Send Password Reset Email
  Future<void> sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog(
        'Processing your request...',
        TImages.successfulPaymentIcon,
      );

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
          title: 'No Internet Connection',
          message: 'Please check your connection and try again.',
        );
        return;
      }

      // Form Validation
      if (!forgetPasswordFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
          title: 'Validation Error',
          message: 'Please enter a valid email address.',
        );
        return;
      }

      // Send password reset email
      await AuthenticationRepository.instance.forgetpassword(email.text.trim());

      TFullScreenLoader.stopLoading();

      // Show success message
      TLoaders.successSnackBar(
        title: 'Email Sent',
        message: 'A link to reset your password has been sent to your email.',
      );

      // Navigate to Forget Password screen
      Get.to(() => Forgetpassword(email: email.text.trim()));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(
        title: 'Oh Snap...',
        message: e.toString(),
      );
    }
  }
}
