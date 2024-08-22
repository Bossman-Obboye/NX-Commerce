
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../icons/circular_icon.dart';

class NxProductQuantityWithAddRemoveButton extends StatelessWidget {
  const NxProductQuantityWithAddRemoveButton({
    super.key,
    this.showInitSpace = false, required this.quantity, this.add, this.remove,
  });

  final bool showInitSpace;
  final int quantity;
  final VoidCallback? add, remove;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showInitSpace) const SizedBox(width: 70),

        /// Add & Remove Buttons
        NxCircularIcon(
          onPressed: remove,
          iconData: Iconsax.minus,
          width: 32,
          height: 32,
          iconSize: NxSizes.md,
          backgroundColor: NxHelpers.isDarkMode(context)
              ? NxColors.darkerGrey
              : NxColors.light,
        ),
        const SizedBox(width: NxSizes.spaceBtwItems),
        Text(quantity.toString(), style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: NxSizes.spaceBtwItems),
         NxCircularIcon(
           onPressed: add,
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
