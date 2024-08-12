import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nx_commerce/common/widgets/navigation_bar/navigation_menu.dart';
import 'package:nx_commerce/features/authentication/screens/onboarding/onboarding_screen.dart';
import 'package:nx_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:nx_commerce/utils/exceptions/firebase_auth_exception.dart';
import 'package:nx_commerce/utils/exceptions/firebase_exception.dart';
import 'package:nx_commerce/utils/exceptions/format_exception.dart';
import 'package:nx_commerce/utils/exceptions/generic_exception.dart';
import 'package:nx_commerce/utils/exceptions/platform_exception.dart';

import '../../../features/authentication/screens/log_in/login.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// -- Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

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
    final user = _auth.currentUser;
    if (user != null) {
      // If the user is logged in
      if (user.emailVerified) {
        // If the email is verified, navigate to NavigationMenu
        Get.offAll(const NavigationMenu());
      } else {
        // I Email is not verified, navigate to VerificationScreen.
        Get.offAll(() => VerifyEmailScreen(
              email: _auth.currentUser?.email,
            ));
      }
    } else {
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
  }

/* ------------------------------ Email & Password sign-in ----------------------------- */

  /// [EmailAuthentication] - Login
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw NxFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw NxFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw NxFormatException();
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code).message;
    } catch (e) {
      throw NxGenericException.instance.message;
    }
  }

  /// [EmailAuthentication] - Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw NxFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw NxFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw NxFormatException();
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code).message;
    } catch (e) {
      throw NxGenericException.instance.message;
    }
  }

  /// [EmailVerification] - Mail Verification
  Future<void> sendEmailVerification() async {
    try {
      return await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw NxFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw NxFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw NxFormatException();
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code).message;
    } catch (e) {
      throw NxGenericException.instance.message;
    }
  }

  /// [ReAuthentication] - ReAuthenticate User

  /// [EmailAuthentication] - Forget Password
  Future<void> sendPasswordResetEmail({required String email}) async {
    try {
      return await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw NxFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw NxFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw NxFormatException();
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code).message;
    } catch (e) {
      throw NxGenericException.instance.message;
    }
  }


/* ------------------------------ Federated identity & social sign-in ----------------------------- */

  /// [GoogleAuthentication] - Google
  Future<UserCredential?> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await userAccount?.authentication;

      // Create a new credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);

    } on FirebaseAuthException catch (e) {
      throw NxFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw NxFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw NxFormatException();
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code).message;
    } catch (e) {
      throw NxGenericException.instance.message;
    }
  }

  /// [FacebookAuthentication] - Facebook

/* ------------------------------ ./end Federated identity & social sign-in ----------------------------- */

  /// [LogoutUser] - Valid for any authentication
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => const LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw NxFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw NxFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw NxFormatException();
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code).message;
    } catch (e) {
      throw NxGenericException.instance.message;
    }
  }

  /// [DeleteUser] - Remove user Auth and Firestore Account.
}
