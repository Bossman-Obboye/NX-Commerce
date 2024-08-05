import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nx_commerce/data/repositories/auth_repo/auth_repository.dart';

import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/loaders/loaders.dart';
import '../../../../utils/network_manager/network_manager.dart';
import '../../../../utils/popups/full_screen_loader.dart';

class LoginController extends GetxController {

  /// Variables
  final Rx<bool> rememberMe = false.obs;
  final Rx<bool> showPassword = false.obs;
  final storage = GetStorage();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();


  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      NxFullScreenLoader.openLoadingDialog('Logging you in...',
          NxImages.staticSuccessIllustration);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        NxFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        // Remove Loader
        NxFullScreenLoader.stopLoading();
        return;
      }

      // Save Date if Remember Me is selected
      if (rememberMe.value) {
        storage.write('REMEMBER_ME_EMAIL', emailController.text.trim());
        storage.write('REMEMBER_ME_PASSWORD', passwordController.text.trim());
        return;
      }

      // Login user using Email & Password Authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(
          emailController.text.trim(), passwordController.text.trim());

      // Remove Loader
      NxFullScreenLoader.stopLoading();

      // Redirect
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
    // Remove Loader
    NxFullScreenLoader.stopLoading();

    // Show some Generic Error to the user
    NxLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }











































  }

}