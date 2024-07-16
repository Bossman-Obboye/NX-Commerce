

import 'package:flutter/material.dart';

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
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return Row(
      children: [
        SizedBox(width: NxSizes.iconMd, height: NxSizes.iconMd, child: Checkbox(value: true, onChanged: (value){}),),
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
