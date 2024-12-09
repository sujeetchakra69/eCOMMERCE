import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:t_store/Screens/verificationScreen.dart';
import 'package:t_store/data/repositories/authentication_reposirtory.dart';
import 'package:t_store/data/repositories/user/userModel.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/formatters/network_manager.dart';
import 'package:t_store/utility/popups/fullScreenLoader.dart';
import 'package:t_store/utility/popups/loaders.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  // Observables and Form Controllers
  final hidepassword = true.obs;
  final privacypolicy = true.obs;

  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController username = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  final GlobalKey<FormState> signupFormkey = GlobalKey<FormState>();

  // Firestore instance
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Signup function
  Future<void> signup() async {
    try {
      // Start loading
      TFullScreenLoader.openLoadingDialog(
          'We are processing your information...',
          TImages.productsIllustration);

      // Check internet connection
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TLoaders.warningSnackBar(
            title: 'No Internet', message: 'Please check your internet connection.');
        return;
      }

      // Form validation
      if (!signupFormkey.currentState!.validate()) return;

      // Privacy policy check
      if (!privacypolicy.value) {
        TLoaders.warningSnackBar(
            title: 'Accept Privacy Policy', message: 'You must accept the privacy policy to proceed.');
        return;
      }

      // Register user in Firebase authentication
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Save authenticated user data in Firebase Firestore
      final user = UserModel(
        id: userCredential.user?.uid ?? '',
        firstName: firstname.text.trim(),
        lastName: lastname.text.trim(),
        username: username.text.trim(),
        email: email.text.trim(),
        phoneNumber: phonenumber.text.trim(),
        profilePicture: '', // You can set a default picture or an empty string
      );

        final userRepository=Get.put(UserRepository());
        await userRepository.saveUserRecord(user);

        TFullScreenLoader.stopLoading();
        TLoaders.successSnackBar(title: 'Congratulation', message: 'Please verify the your email');

        Get.to(()=> VerificationScreen(email:email.text.trim() ,));
      // Convert UserModel to JSON and store in Firestore
    //   await _firestore
    //       .collection('users')
    //       .doc(user.id)
    //       .set(user.toJson());

    //   // Show success message (optional)
    //   TLoaders.successSnackBar(
    //     title: 'Signup Successful',
    //     message: 'Welcome, ${user.fullName}!',
    //   );
    // } catch (e) {
    //   TLoaders.errorSnackBar(
    //       title: 'Oh Snap!', message: e.toString());
    // } finally {
    //   TFullScreenLoader.stopLoading();
    // }


    
  }
  catch(e){
    TFullScreenLoader.stopLoading();
    TLoaders.errorSnackBar(title: 'Oh Snap',message: e.toString());  }
}}
