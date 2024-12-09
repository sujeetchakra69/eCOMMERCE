import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/Screens/SuccessScreen.dart';
import 'package:t_store/data/repositories/authentication_reposirtory.dart';
import 'package:t_store/utility/popups/loaders.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  @override
  void onInit() {
    sendEmailVerification();
    setTimerForAutoRedirect();
    super.onInit();
  }

  //send verification link
  Future <void>sendEmailVerification() async {
    try {
      await AuthenticationRepository.instance.sendEmailVerification();
      TLoaders.successSnackBar(
          title: 'Email Sent', message: 'Please Check your email.');
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh Snap!!!', message: e.toString());
    }
  }


  //set timer for auto redirect
  setTimerForAutoRedirect(){
    Timer.periodic(const Duration(seconds: 1),(timer){
      FirebaseAuth.instance.currentUser?.reload();
      final user= FirebaseAuth.instance.currentUser;
      if(user?.emailVerified?? false){
        timer.cancel();
        Get.off(()=> const Successscreen());
      }

    });


  }
  checkEmailVerificationStatus()async{
    final currentUser =FirebaseAuth.instance.currentUser;
    if (currentUser !=null && currentUser.emailVerified){
      Get.off(const Successscreen());


    }


  }
}
