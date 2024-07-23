
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../icons/circular_icon.dart';

class NxProductQuantityWithAddRemoveButton extends StatelessWidget {
  const NxProductQuantityWithAddRemoveButton({
    super.key,
    this.showInitSpace = false,
  });

  final bool showInitSpace;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showInitSpace) const SizedBox(width: 70),

        /// Add & Remove Buttons
        NxCircularIcon(
          iconData: Iconsax.minus,
          width: 32,
          height: 32,
          iconSize: NxSizes.md,
          backgroundColor: NxHelpers.isDarkMode(context)
              ? NxColors.darkerGrey
              : NxColors.light,
        ),
        const SizedBox(width: NxSizes.spaceBtwItems),
        Text("2", style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: NxSizes.spaceBtwItems),
        const NxCircularIcon(
            iconData: Iconsax.add,
            width: 32,
            height: 32,
            iconSize: NxSizes.md,
            iconColor: NxColors.white,
            backgroundColor: NxColors.primary),
      ],
    );
  }
}
