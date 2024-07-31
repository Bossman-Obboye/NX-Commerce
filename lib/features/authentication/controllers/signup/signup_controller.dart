import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/data/repositories/auth_repo/auth_repository.dart';
import 'package:nx_commerce/data/repositories/user/user_repository.dart';
import 'package:nx_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/loaders/loaders.dart';
import 'package:nx_commerce/utils/network_manager/network_manager.dart';
import 'package:nx_commerce/utils/popups/full_screen_loader.dart';

import '../../models/user/user_model.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Fields
  final Rx<bool> policyIsAccepted = false.obs;
  final Rx<bool> hidePassword =
      true.obs; // Observable for hiding/showing password
  final TextEditingController emailController =
      TextEditingController(); // Controller for email input field
  final TextEditingController lastNameController =
      TextEditingController(); // Controller for last name input field
  final TextEditingController firstNameController =
      TextEditingController(); // Controller for first name input field
  final TextEditingController userNameController =
      TextEditingController(); // Controller for username input field
  final TextEditingController passwordController =
      TextEditingController(); // Controller for password input field
  final TextEditingController phoneNumberController =
      TextEditingController(); // Controller for phone number input field

  GlobalKey<FormState> signupFormKey =
      GlobalKey<FormState>(); // Form key for for validation

  /// --- SIGNUP
  void signup() async {
    try {
      // Start Loading
      NxFullScreenLoader.openLoadingDialog('We are processing your information',
          NxImages.staticSuccessIllustration);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        
        // Remove Loader
        NxFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()){
        
        // Remove Loader
        NxFullScreenLoader.stopLoading();
        return;
      }

      // Privacy Policy Check
      if (!policyIsAccepted.value) {
        NxLoaders.warningSnackBar(
            title: 'Accept Privacy Policy',
            message:
                'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.');
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase
      final userCredential = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(
              emailController.text.trim(), passwordController.text.trim());

      // Save Authenticated user data in the Firebase Firestore
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        username: userNameController.text.trim(),
        email: emailController.text.trim(),
        phoneNumber: phoneNumberController.text.trim(),
        profilePicture: '',
      );

      final userRepository = Get.put(UserRepository());
      await userRepository.saveUserRecord(newUser);

      // Remove Loader
      NxFullScreenLoader.stopLoading();

      // Show Success Message
      NxLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your account has been created! Verify email to continue.');

      // Move to Verify Email Screen
      Get.to(() => const VerifyEmailScreen());
    } catch (e) {
      // Remove Loader
      NxFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      NxLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
