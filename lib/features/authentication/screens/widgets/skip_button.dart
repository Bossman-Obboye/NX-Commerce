
import 'package:flutter/material.dart';
import 'package:nx_commerce/features/authentication/controllers/onboarding_controller.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';

class OnboardingSkip extends StatelessWidget {
  const OnboardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: NxDeviceUtils.getAppBarHeight(),
      right: NxSizes.defaultSpace,
      child:  TextButton(
        onPressed: () => OnBoardingController.instance.skipPage(),
        child: const Text("Skip"),
      ),
    );
  }
}
