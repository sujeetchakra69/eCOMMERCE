import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:t_store/data/repositories/user/userModel.dart';
import 'package:t_store/data/repositories/user/user_repository.dart';
import 'package:t_store/utility/popups/loaders.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileloading = false.obs;

  Rx<UserModel> user = UserModel.empty().obs;
  final userRepository = Get.put(UserRepository());

  @override
  void onInit() {
    super.onInit();
    fetchUserRecords();
  }

  Future<void> fetchUserRecords() async {
    try {
      profileloading.value = true;

      final fetchedUser = await userRepository.fetchUserDetails();
      print('Fetched User: ${fetchedUser.toJson()}'); // Debugging
      user.value = fetchedUser;
    } catch (e) {
      print('Error fetching user: $e');
      user.value = UserModel.empty();
    } finally {
      profileloading.value = false;
    }
  }

  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      if (userCredentials != null && userCredentials.user != null) {
        final displayName = userCredentials.user!.displayName ?? '';
        final nameParts = UserModel.nameParts(displayName);
        final username = UserModel.generateUsername(displayName);

        final user = UserModel(
          id: userCredentials.user!.uid,
          username: username,
          email: userCredentials.user!.email ?? '',
          firstName: nameParts.isNotEmpty ? nameParts[0] : '',
          lastName: nameParts.length > 1 ? nameParts.sublist(1).join(" ") : '',
          phoneNumber: userCredentials.user!.phoneNumber ?? '',
          profilePicture: userCredentials.user!.photoURL ?? '',
        );

        await userRepository.saveUserRecord(user);
        this.user.value = user;
        print('User saved: ${user.toJson()}'); // Debugging
      } else {
        TLoaders.warningSnackBar(
          title: 'Error',
          message: 'User credentials are missing or invalid.',
        );
      }
    } catch (e) {
      print('Error saving user: $e');
      TLoaders.warningSnackBar(
        title: 'Data not found',
        message:
            'Something went wrong while saving your information. You can re-save your data in your profile.',
      );
    }
  }
}
