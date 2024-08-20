import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/data/repositories/user/user_repository.dart';
import 'package:nx_commerce/features/personalization/controllers/user_controller.dart';
import 'package:nx_commerce/features/personalization/screens/profile/profile.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/loaders/loaders.dart';
import 'package:nx_commerce/utils/helpers/network_manager.dart';
import 'package:nx_commerce/utils/popups/full_screen_loader.dart';

class UpdateNameController extends GetxController {
  static UpdateNameController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userController = UserController.instance;
  final userRepository = Get.put(UserRepository());
  GlobalKey<FormState> updateUserNameFormKey = GlobalKey<FormState>();

  /// init user data when Home Screen appears
  @override
  void onInit() {
    initializedNames();
    super.onInit();
  }

  /// Fetch user record
  Future<void> initializedNames() async {
    firstName.text = userController.user.value.firstName;
    lastName.text = userController.user.value.lastName;
  }
  
  /// Update username
  Future<void> updateUserName() async {
    try{
      // Start Loading
      NxFullScreenLoader.openLoadingDialog('We are updating your information...', NxImages.darkAppLogo);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected){
        NxFullScreenLoader.stopLoading();
        return;
      }

      if(!updateUserNameFormKey.currentState!.validate()) {
        NxFullScreenLoader.stopLoading();
        return;
      }

      // Update user's first & last name in the Firebase Firestore
      Map<String, dynamic> name = {
        'FirstName' : firstName.text.trim(), 'LastName': lastName.text.trim()
      };

      await userRepository.updateSingleField(name);

      // Update the Rx User value
      userController.user.value.firstName = firstName.text.trim();
      userController.user.value.lastName = lastName.text.trim();

      // Remove Loader
      NxFullScreenLoader.stopLoading();

      // Show Success Message
      NxLoaders.successSnackBar(title: 'Congratulations', message: 'Your Name has been updated.');

      // Move to previous screen
      Get.offAll(() => const ProfileScreen());

    }catch(e){
      // Stop Loading
      NxFullScreenLoader.stopLoading();

      // Display failure message
      NxLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      
    }
  }

}