
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/loaders/loaders.dart';
import 'package:nx_commerce/utils/network_manager/network_manager.dart';
import 'package:nx_commerce/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {

  static SignupController get instance => Get.find();

  /// Fields
  final Rx<bool> policyIsAccepted = false.obs;
  final Rx<bool> hidePassword = true.obs; // Observable for hiding/showing password
  final TextEditingController emailController = TextEditingController(); // Controller for email input field
  final TextEditingController lastNameController = TextEditingController(); // Controller for last name input field
  final TextEditingController firstNameController = TextEditingController(); // Controller for first name input field
  final TextEditingController userNameController = TextEditingController(); // Controller for username input field
  final TextEditingController passwordController = TextEditingController(); // Controller for password input field
  final TextEditingController phoneNumberController = TextEditingController(); // Controller for phone number input field

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>(); // Form key for for validation


  /// --- SIGNUP
  Future<void> signup() async {
    try {
      // Start Loading
      NxFullScreenLoader.openLoadingDialog('We are processing your information', NxImages.staticSuccessIllustration);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) return;

      // Form Validation
      if(!signupFormKey.currentState!.validate()) return;

      // Privacy Policy Check
      if(!policyIsAccepted.value){
        NxLoaders.warningSnackBar(title: 'Accept Privacy Policy', message: 'In order to create account, you must have to read and accept the Privacy Policy & Terms of Use.');
        return;
      }

      // Register user in the Firebase Authentication & Save user data in the Firebase

      // Save Authenticated user data in the Firebase Firestore

      // Show Success Message

      // Move to Verify Email Screen

    } catch (e) {
      // Show some Generic Error to the user
      NxLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally{
      // Remove Loader
      NxFullScreenLoader.stopLoading();
    }
  }

}

