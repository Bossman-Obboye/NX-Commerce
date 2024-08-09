import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/common/widgets/success_screen/success_screen.dart';
import 'package:nx_commerce/data/repositories/auth_repo/auth_repository.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/loaders/loaders.dart';

import '../../../../utils/constants/text_strings.dart';

class VerifyEmailController extends GetxController {
  static VerifyEmailController get instance => Get.find();

  /// -- Send Email whenever Verify Screen appears & Set Timer for auto redirect.
  @override
  void onInit() {
    sendEmailVerification();
    super.onInit();
  }

  /// -- Send Email Verification link
  sendEmailVerification() async {
    await AuthenticationRepository.instance.sendEmailVerification();
    NxLoaders.successSnackBar(
        title: "Email Sent!",
        message: 'Please Check your inbox and verify your email.');
    try {} catch (e) {
      NxLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  /// -- Timer to automatically redirect on Email Verification
  setTimerForAutoRedirect() {
    Timer.periodic(const Duration(seconds: 1), (timer) async {
      await FirebaseAuth.instance.currentUser?.reload();
      final user = FirebaseAuth.instance.currentUser;

      if (user?.emailVerified ?? false) {
        timer.cancel();
        Get.off(() => SuccessScreen(
            image: NxImages.staticSuccessIllustration,
            title: NxTexts.yourAccountCreatedTitle,
            subTitle: NxTexts.yourAccountCreatedSubTitle,
            onPressed: () =>
                AuthenticationRepository.instance.screenRedirect()));
      }
    });
  }

  /// -- Manually Check if Email Verified
  checkEmailVerificationStatus() async {
    print('Inside the check email verification status functions');
    final currentUser = FirebaseAuth.instance.currentUser;
    log((currentUser != null).toString());
    log((currentUser?.emailVerified).toString());
    if (currentUser != null && currentUser.emailVerified) {
      print('$currentUser');
      Get.off(
        () => SuccessScreen(
            image: NxImages.staticSuccessIllustration,
            title: NxTexts.yourAccountCreatedTitle,
            subTitle: NxTexts.yourAccountCreatedSubTitle,
            onPressed: () {
              log('Calling');

              // AuthenticationRepository.instance.screenRedirect();
            }),
      );
    }
  }
}
