
import 'package:flutter/material.dart';
import 'package:nx_commerce/features/authentication/controllers/onboarding_controller.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helpers.dart';

class OnboardingDotNavigation extends StatelessWidget {
  const OnboardingDotNavigation({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return Positioned(
      bottom: NxDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: NxSizes.defaultSpace,
      child: SmoothPageIndicator(
        controller: controller.pageController,
        count: 3,
        onDotClicked: controller.dotNavigationOnClick,
        effect:  ExpandingDotsEffect(
          activeDotColor: isDarkMode ? NxColors.light : NxColors.dark,
          dotHeight: 6,
        ),
      ),
    );
  }
}
