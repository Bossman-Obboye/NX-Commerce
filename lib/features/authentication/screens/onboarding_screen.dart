import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/features/authentication/screens/widgets/onboarding_dot_navigation.dart';
import 'package:nx_commerce/features/authentication/screens/widgets/onboarding_next_button.dart';
import 'package:nx_commerce/features/authentication/screens/widgets/onboarding_page.dart';
import 'package:nx_commerce/features/authentication/screens/widgets/skip_button.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/constants/text_strings.dart';

import '../controllers/onboarding_controller.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          /// Onboarding contents
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingPage(
                title: NxTexts.onBoardingTitle1,
                subTitle: NxTexts.onBoardingSubTitle1,
                image: NxImages.onboardingImage1,
              ),
              OnboardingPage(
                title: NxTexts.onBoardingTitle2,
                subTitle: NxTexts.onBoardingSubTitle2,
                image: NxImages.onboardingImage2,
              ),
              OnboardingPage(
                title: NxTexts.onBoardingTitle3,
                subTitle: NxTexts.onBoardingSubTitle3,
                image: NxImages.onboardingImage3,
              ),
            ],
          ),

          /// Skip button
          const OnboardingSkip(),

          /// Dot Navigation SmoothPageIndicator
          const OnboardingDotNavigation(),

          /// Circular Button
        const  OnboardingNextButton()
        ],
      ),
    );
  }
}
