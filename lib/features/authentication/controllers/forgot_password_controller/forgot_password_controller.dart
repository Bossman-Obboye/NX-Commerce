import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:nx_commerce/data/repositories/auth_repo/auth_repository.dart';
import 'package:nx_commerce/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/loaders/loaders.dart';
import 'package:nx_commerce/utils/network_manager/network_manager.dart';
import 'package:nx_commerce/utils/popups/full_screen_loader.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get instance => Get.find();

  /// Variables
  final emailController = TextEditingController();
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();

  /// Send Reset Password
   sendPasswordResetEmail() async {
    try {
    // Start Loading
      NxFullScreenLoader.openLoadingDialog('Processing your request...', NxImages.darkAppLogo);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {NxFullScreenLoader.stopLoading(); return;}

      // Form Validation
      if(!forgotPasswordFormKey.currentState!.validate()){
        NxFullScreenLoader.stopLoading();
        return;
      }

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email: emailController.text.trim());
      
      // Remove Loader 
      NxFullScreenLoader.stopLoading();
      
      // Show Success Screen
      NxLoaders.successSnackBar(title: 'Email Sent', message: 'Email link Sent ot Reset your Password.'.tr);

      // Redirect
      Get.to(() => ResetPasswordScreen(email: emailController.text.trim()));

    } catch (e) {
      // Remove Loader
      NxFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      NxLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      // Start Loading
      NxFullScreenLoader.openLoadingDialog('Processing your request...', NxImages.darkAppLogo);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {NxFullScreenLoader.stopLoading(); return;}

      // Send Email to Reset Password
      await AuthenticationRepository.instance.sendPasswordResetEmail(email: email);

      // Remove Loader
      NxFullScreenLoader.stopLoading();

      // Show Success Screen
      NxLoaders.successSnackBar(title: 'Email Sent', message: 'Email link Sent ot Reset your Password.'.tr);

    } catch (e) {
      // Remove Loader
      NxFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      NxLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }
  }
}
