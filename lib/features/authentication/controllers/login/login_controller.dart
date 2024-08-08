import 'dart:developer';

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
      log('Just Started');
      // Start Loading
      NxFullScreenLoader.openLoadingDialog('Logging you in...',
          NxImages.staticSuccessIllustration);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        log('No Internet');
        // Remove Loader
        NxFullScreenLoader.stopLoading();
        return;
      }
      log("Internet is available");
      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        log('Form is not valid');
        // Remove Loader
        NxFullScreenLoader.stopLoading();
        return;
      }

      log('Form is valid');
      // Save Date if Remember Me is selected
      if (rememberMe.value) {
        log("Remember me : ${rememberMe.value}");
        storage.write('REMEMBER_ME_EMAIL', emailController.text.trim());
        storage.write('REMEMBER_ME_PASSWORD', passwordController.text.trim());
      }

      // Login user using Email & Password Authentication
      log('Logging in user');
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(
          emailController.text.trim(), passwordController.text.trim());
       log('Log in successful');
      // Remove Loader
      NxFullScreenLoader.stopLoading();

      // Redirect
      log("Redirecting Screen");
      AuthenticationRepository.instance.screenRedirect();

    } catch (e) {
      log('Error Catch');
    // Remove Loader
    NxFullScreenLoader.stopLoading();

    // Show some Generic Error to the user
    NxLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    }











































  }

}