import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:t_store/Screens/login/login_page.dart';
import 'package:t_store/Screens/verificationScreen.dart';
import 'package:t_store/exceptions/firebase_auth_exceptions.dart';
import 'package:t_store/exceptions/firebase_exceptions.dart';
import 'package:t_store/exceptions/format_exceptions.dart';
import 'package:t_store/exceptions/platform_exceptions.dart';
import 'package:t_store/navigation.dart';
import 'package:t_store/features/authentication/views/onBoarding.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  // Firebase authentication instance
  final FirebaseAuth _auth = FirebaseAuth.instance;
  
  // Local storage instance
  final deviceStorage = GetStorage();

  //get authenticated user data
  User? get authUser =>_auth.currentUser;
  

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  // Redirect to the appropriate screen
   screenRedirect()  async {
    final User? user=_auth.currentUser;
    if(user!= null){
      if(user.emailVerified){
        Get.offAll(()=>const NavigationMenu());

      }
      else {
        Get.offAll(()=>VerificationScreen(email: _auth.currentUser?.email,));
      }
    }
    else{
        deviceStorage.writeIfNull('isFirstTime', true);
    deviceStorage.read('isFirstTime') != true
        ? Get.offAll(() => const LoginPage())
        : Get.offAll(() => const OnBoardingScreen());

    }

  
  }

  // Register with email and password
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw Exception('Firebase Error: ${e.message}');
    } on PlatformException catch (e) {
      throw Exception('Platform Error: ${e.message}');
    } catch (e) {
      throw Exception('An unknown error occurred');
    }
  }

//send email verification

  Future<void > sendEmailVerification()async{
    try{
      await _auth.currentUser?.sendEmailVerification();

    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;

    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;

    } on  FormatException catch (_){
      throw const TFormatException();
    }

    on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }

  //send forget password


  Future<void > forgetpassword(String email)async{
    try{
await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;

    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;

    } on  FormatException catch (_){
      throw const TFormatException();
    }

    on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }


  //logout 

  Future<void > logout()async{
    try{
      await FirebaseAuth.instance.signOut();
      Get.offAll(()=> const LoginPage());

    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;

    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;

    } on  FormatException catch (_){
      throw const TFormatException();
    }

    on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }


  //login with email and password

  Future<void > loginwithEmailandPassword(String email, String password)async{
    try{
      await _auth.currentUser?.sendEmailVerification();

    } on FirebaseAuthException catch(e){
      throw TFirebaseAuthException(e.code).message;

    } on FirebaseException catch (e){
      throw TFirebaseException(e.code).message;

    } on  FormatException catch (_){
      throw const TFormatException();
    }

    on PlatformException catch (e){
      throw TPlatformException(e.code).message;
    }
    catch(e){
      throw 'Something went wrong. Please try again';
    }
  }
   // Method to sign in using email and password
  Future<UserCredential?> signInWithEmailAndPassword(String email, String password) async {
    try {
      // Attempt to sign in with the provided email and password
      final userCredential = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );
      
      // Check if the email is verified
      if (!userCredential.user!.emailVerified) {
        await userCredential.user!.sendEmailVerification();
        throw Exception("Email not verified. Please check your inbox.");
      }
      
      // Return the signed-in user
      return userCredential;
    } on FirebaseAuthException catch (e) {
      // Handle Firebase authentication-specific errors
      switch (e.code) {
        case 'user-not-found':
          throw Exception("No user found for that email.");
        case 'wrong-password':
          throw Exception("Incorrect password. Please try again.");
        case 'invalid-email':
          throw Exception("The email address is not valid.");
        default:
          throw Exception("Authentication error: ${e.message}");
      }
    } catch (e) {
      // Handle other exceptions
      throw Exception("An unknown error occurred: $e");
    }
  }


  // Google Sign-In
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the Google authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      if (userAccount == null) {
        // User canceled the sign-in
        return null;
      }

      // Obtain the Google Sign-In authentication details
      final GoogleSignInAuthentication googleAuth =
          await userAccount.authentication;

      // Create a new credential using the access and ID tokens
      final credentials = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw Exception("Authentication error: ${e.message}");
    } catch (e) {
      return null;
    }
  }

//facebook SignIn






 }
