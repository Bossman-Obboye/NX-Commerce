import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nx_commerce/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:nx_commerce/features/authentication/screens/signup/signup.dart';

import '../../../features/authentication/screens/log_in/login.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// -- Variables
  final deviceStorage = GetStorage();

  /// Called from main.dart an app launch
  @override
  void onReady() {
    // Remove the native splash screen
    FlutterNativeSplash.remove();
    // Redirect to the appropriate screen
    screenRedirect();
  }

  /// Function to Show Relevant Screen
  screenRedirect() async {
    // Local Storage
    deviceStorage.writeIfNull('IsFirstTime', true);
    // Check if it's the first time launching the app
    deviceStorage.read('IsFirstTime') != true
        ? Get.offAll(() {
            log('Navigating');
            return const LoginScreen();
          }) // Redirect to Login Screen if not the first time
        : Get.offAll(() =>
            const OnBoardingScreen()); // Redirect to OnBoarding Screen if it's the first time
  }

/* ------------------------------ Email & Password sign-in ----------------------------- */

  /// [EmailAuthentication] - SignIn

  /// [EmailAuthentication[ - Register

  /// [EmailVerification] - Mail Verification

  /// [ReAuthentication] - ReAuthenticate User

  /// [EmailAuthentication] - Forget Password

/* ------------------------------ Federated identity & social sign-in ----------------------------- */

  /// [GoogleAuthentication] - Google

  /// [FacebookAuthentication] - Facebook

/* ------------------------------ ./end Federated identity & social sign-in ----------------------------- */

  /// [LogoutUser] - Valid for any authentication

  /// [DeleteUser] - Remove user Auth and Firestore Account.
}
