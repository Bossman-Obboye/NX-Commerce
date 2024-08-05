import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/utils/constants/colors.dart';

import '../../common/widgets/loaders/animation_loader.dart';
import '../helpers/helpers.dart';


/// A utility class for managing a full-screen loading dialog.
class NxFullScreenLoader {
  /// Open a full-screen loading dialog with a given text and animation.
  /// This method doesn't return anything/
  ///
  /// Parameters:
  ///   - text: The text to be displayed in the loading dialog.
  ///   - animation: The Lottie animation to be shown.
  static void openLoadingDialog(String text, String animation) {
    showDialog(
      context: Get.overlayContext!,
      // Use Get.overlayContext to overlay dialogs
      barrierDismissible: false,
      // The dialog can't be dismissed by tapping outside it
      builder: (_) =>  //Container(color: NxColors.primary, child: const Center(child: CircularProgressIndicator(),))
      PopScope(
        canPop: false, // Disable popping with the back button
        child: Container(
          color: NxHelpers.isDarkMode(Get.context!)
              ? NxColors.dark
              : NxColors.white,
          height: MediaQuery.of(Get.context!).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(height: 250),
              NxAnimationLoaderWidget(text: text, animation: animation),
            ],
          ),
        ),
      ),
    );
  }

  /// Stop the currently open loading dialog.
  /// This method doesn't return anything.
  static stopLoading() {
    Navigator.of(Get.overlayContext!).pop(); // Close the dialog using the Navigator.
  }
}

