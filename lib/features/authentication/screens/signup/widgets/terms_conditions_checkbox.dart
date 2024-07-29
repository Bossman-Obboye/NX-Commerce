

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nx_commerce/features/authentication/controllers/signup/signup_controller.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../../../utils/helpers/helpers.dart';

class TermsAndConditionsCheckbox extends StatelessWidget {
  const TermsAndConditionsCheckbox({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    final controller = SignupController.instance;
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return Row(
      children: [
        SizedBox(width: NxSizes.iconMd, height: NxSizes.iconMd, child: Obx( () => Checkbox(value: controller.policyIsAccepted.value, onChanged: (value) => controller.policyIsAccepted.value = !controller.policyIsAccepted.value)),),
        const SizedBox(width: NxSizes.spaceBtwItems,),
        Flexible(
          child: RichText(text: TextSpan(
              children: [
                TextSpan(text:  '${NxTexts.iAgreeTo} ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text:  '${NxTexts.privacyPolicy} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: isDarkMode ? NxColors.white : NxColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: isDarkMode ? NxColors.white : NxColors.primary,
                ),),
                TextSpan(text:  '${NxTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
                TextSpan(text:  '${NxTexts.termsOfUse} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
                  color: isDarkMode ? NxColors.white : NxColors.primary,
                  decoration: TextDecoration.underline,
                  decorationColor: isDarkMode ? NxColors.white : NxColors.primary,
                ),),
              ]
          )),
        )
      ],
    );
  }
}
