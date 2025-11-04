import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_sign_in/google_sign_in.dart';
import 'package:t_store/Screens/login_page.dart';
import 'package:t_store/navigation.dart';

class LoginController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      if (googleUser == null) return null; // user canceled

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      return await _auth.signInWithCredential(credential);
    } catch (e) {
      debugPrint("Error signing in with Google: $e");
      return null;
    }
  }

  Future<void> login(
      String email, String password, BuildContext? context) async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password.trim(),
      );

      ScaffoldMessenger.of(context!).showSnackBar(
        const SnackBar(content: Text("Login successful!")),
      );

      // Navigate to home screen
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const NavigationMenu()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context!).showSnackBar(
        SnackBar(content: Text(e.message ?? "Login failed")),
      );
    }
  }

  Future<void> logoutUser() async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      final GoogleSignIn googleSignIn = GoogleSignIn();

      // Check if user signed in using Google
      final currentUser = auth.currentUser;
      final providerData = currentUser?.providerData;

      bool isGoogleUser = providerData?.any(
            (provider) => provider.providerId == 'google.com',
          ) ??
          false;

      if (isGoogleUser) {
        await googleSignIn.signOut(); // Sign out from Google
      }

      await auth.signOut();
      Get.offAll(() => const LoginPage());
      print("Successfully logged out");
    } catch (e) {
      print("Error logging out: $e");
    }
  }

  Future<void> registerUser(String email, String password) async {
    try {
      debugger();
      // Create the user
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      // Send verification email
      await userCredential.user?.sendEmailVerification();

      print(
          "Verification email has been sent to ${userCredential.user?.email}");
    } on FirebaseAuthException catch (e) {
      print("Error: ${e.message}");
    }
  }
}
