import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/features/authentication/screens/log_in/login.dart';
import 'package:nx_commerce/common/widgets/success_screen/success_screen.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon:
                  // TODO: Check the Icon's Colors in both light and dork mode
                  const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(NxSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(
                image: const AssetImage(NxImages.deliveredEmailIllustration),
                width: NxHelpers.screenWidth() * 0.6,
                height: NxHelpers.screenHeight() * 0.3,
              ),
              const SizedBox(
                height: NxSizes.spaceBtwSections,
              ),

              /// Title
              Text(NxTexts.confirmEmailTitle,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: NxSizes.spaceBtwItems),

              /// SubTitle
              Text("abless024@gmail.com",
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: NxSizes.spaceBtwItems),
              Text(NxTexts.confirmEmailSubTitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: NxSizes.spaceBtwSections),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => SuccessScreen(
                        image: NxImages.staticSuccessIllustration,
                        title: NxTexts.yourAccountCreatedTitle,
                        subTitle: NxTexts.yourAccountCreatedSubTitle,
                        onPressed: () => Get.to(() => const LoginScreen()),
                      )),
                  child: const Text(NxTexts.tContinue),
                ),
              ),
              const SizedBox(
                height: NxSizes.spaceBtwItems,
              ),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {},
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