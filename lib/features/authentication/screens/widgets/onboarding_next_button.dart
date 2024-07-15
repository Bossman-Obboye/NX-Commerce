
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/features/authentication/controllers/onboarding_controller.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helpers.dart';

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return Positioned(
        bottom: NxDeviceUtils.getBottomNavigationBarHeight(),
        right: NxSizes.defaultSpace,
        child: ElevatedButton(
          onPressed: () => OnBoardingController.instance.goToNextPage(),
          style: ElevatedButton.styleFrom(
            shape: const CircleBorder(),
            backgroundColor: isDarkMode ? NxColors.primary : Colors.black,
          ),
          child: const Icon(Iconsax.arrow_right_3),
        ));
  }
}
