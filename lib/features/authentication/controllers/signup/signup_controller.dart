
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/utils/popups/full_screen_loader.dart';

class SignupController extends GetxController {

  static SignupController get instance => Get.find();

  /// Fields
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
      NxFullScreenLoader.openLoadingDialog('We are processing your information', '');

      // Check Internet Connectivity

      // Form Validation

      // Privacy Policy Check

      // Register user in the Firebase Authentication & Save user data in the Firebase

      // Save Authenticated user data in the Firebase Firestore

      // Show Success Message

      // Move to Verify Email Screen

    } catch (e) {
      // Show some Generic Error to the user
    } finally{
      // Remove Loader
    }
  }

}

