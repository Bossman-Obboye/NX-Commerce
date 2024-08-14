import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/data/repositories/auth_repo/auth_repository.dart';
import 'package:nx_commerce/data/repositories/user/user_repository.dart';
import 'package:nx_commerce/features/authentication/models/user/user_model.dart';
import 'package:nx_commerce/features/authentication/screens/log_in/login.dart';
import 'package:nx_commerce/features/personalization/screens/profile/re_authenticate_user_login_form.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/loaders/loaders.dart';
import 'package:nx_commerce/utils/popups/full_screen_loader.dart';

import '../../../utils/constants/sizes.dart';
import '../../../utils/network_manager/network_manager.dart';

class UserController extends GetxController {
  static UserController get instance => Get.find();

  /// Variables
  final userRepository = Get.put(UserRepository());
  final Rx<UserModel> user = UserModel.empty().obs;
  final RxBool profileLoading = false.obs;
  final RxBool hidePassword = false.obs;
  final TextEditingController verifyPassword = TextEditingController();
  final TextEditingController verifyEmail = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user Record from any Registration provider.
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // First Update Rx User and then check if user data is already stored. If not store new data
      await fetchUserRecord();

      // If no record already stored.
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Convert Name to First and Last Name
          final nameParts =
              UserModel.nameParts(userCredentials.user!.displayName ?? '');
          final username = UserModel.generateUsername(
              userCredentials.user!.displayName ?? '');

          // Map Data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName:
                nameParts.length > 1 ? nameParts.sublist(1).join(' ') : '',
            username: username,
            email: userCredentials.user!.email ?? '',
            phoneNumber: userCredentials.user!.phoneNumber ?? '',
            profilePicture: userCredentials.user!.photoURL ?? '',
          );

          // Save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (_) {
      NxLoaders.warningSnackBar(
          title: "Data not saved",
          message:
              "Something went wrong while saving your information. You can re-save your data in your Profile.");
    }
  }

  void deleteAccountWarningPopup() {
    Get.defaultDialog(
      contentPadding: const EdgeInsets.all(NxSizes.md),
      title: 'Delete Account',
      middleText:
          'Are you sure you want to delete your account permanently? This action is not reversible and all your data will be removed permanently.',
      confirm: ElevatedButton(
        onPressed: () async => deleteUserAccount(),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: NxSizes.lg),
          child: Text('Delete'),
        ),
      ),
      cancel: OutlinedButton(
        onPressed: () => Navigator.of(Get.overlayContext!).pop(),
        child: const Text('Cancel'),
      ),
    );
  }

  void deleteUserAccount() async {
    try {
      // Start Loading
      NxFullScreenLoader.openLoadingDialog('Processing', NxImages.darkAppLogo);

      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider =
          auth.authUser!.providerData.map((e) => e.providerId).first;
      if (provider.isNotEmpty) {
        // Re-Verify Auth Email
        if (provider == 'google.com') {
          // Sign in with Google
          await auth.signInWithGoogle();
          // Delete the account of the user
          await auth.deleteAccount();

          // Stop Loading
          NxFullScreenLoader.stopLoading();

          // Navigate to LoginScreen
          Get.offAll(() => const LoginScreen());
        } else if (provider == 'password') {
          // Stop Loading
          NxFullScreenLoader.stopLoading();

          // Navigate to Re-Authenticate the user.
          Get.to(() => const ReAuthLoginForm());
        }
      }
    } catch (e) {
      NxFullScreenLoader.stopLoading();
      // Stop Loading

      // Show the error message
      NxLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString);
    }
  }

  Future<void> reAuthenticateEmailAndPasswordUser() async {
    try {
      // Start Loading
      NxFullScreenLoader.openLoadingDialog(
          'Processing...', NxImages.staticSuccessIllustration);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        NxFullScreenLoader.stopLoading();
        return;
      }
      // Form Validation
      if (!reAuthFormKey.currentState!.validate()) {
        // Remove Loader
        NxFullScreenLoader.stopLoading();
        return;
      }

      // Re-Authenticate User with Email and Password
      await AuthenticationRepository.instance
          .reAuthenticateWithEmailAndPassword(
              verifyEmail.text.trim(), verifyPassword.text.trim());

      // Delete the User's account
      await AuthenticationRepository.instance.deleteAccount();

      // Remove Loader
      NxFullScreenLoader.stopLoading();

      // Navigate to LoginScreen
      Get.offAll(() => const LoginScreen());
    } catch (e) {
      // Remove Loader
      NxFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      NxLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
