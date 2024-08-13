import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/features/authentication/controllers/forgot_passsword_controller/forgot_password_controller.dart';
import 'package:nx_commerce/features/authentication/screens/log_in/login.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/constants/text_strings.dart';

import '../../../../utils/helpers/helpers.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(NxSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Image
              Image(image: const AssetImage(NxImages.deliveredEmailIllustration),
                width: NxHelpers.screenWidth() * 0.6,
                height: NxHelpers.screenHeight() * 0.3,
              ),
              const SizedBox(height: NxSizes.spaceBtwSections,),
        
              /// Email
              Text(email, style: Theme.of(context).textTheme.bodyMedium, textAlign: TextAlign.center),
              const SizedBox(height: NxSizes.spaceBtwItems),

              /// Title
              Text(NxTexts.changeYourPasswordTitle, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: NxSizes.spaceBtwItems),

              /// SubTitle
              Text(NxTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: NxSizes.spaceBtwSections),
        
              /// Reset Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(() => const LoginScreen()),
                  child: const Text(NxTexts.done),
                ),
              ),
              const SizedBox(height: NxSizes.spaceBtwItems,),

              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () => ForgotPasswordController.instance.resendPasswordResetEmail(email),
                  child: const Text(NxTexts.resendEmail),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
