import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/common/widgets/icons/circular_icon.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';

class NxBottomAddToCart extends StatelessWidget {
  const NxBottomAddToCart({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: NxSizes.defaultSpace, vertical: NxSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: isDarkMode ? NxColors.darkerGrey : NxColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(NxSizes.cardRadiusLg),
          topRight: Radius.circular(NxSizes.cardRadiusLg),
        ),
      ),
      child: Row(
        children: [
          const NxCircularIcon(
              iconData: Iconsax.minus,
              backgroundColor: NxColors.darkerGrey,
              width: 40,
              height: 40,
              iconColor: NxColors.white),
          const SizedBox(width: NxSizes.spaceBtwItems),
          Text("2", style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(width: NxSizes.spaceBtwItems),
          const NxCircularIcon(
              iconData: Iconsax.add,
              backgroundColor: NxColors.black,
              width: 40,
              height: 40,
              iconColor: NxColors.white),
          const Spacer(),
          ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(NxSizes.md),
                backgroundColor: NxColors.black,
                side: const BorderSide(color: NxColors.black),
              ),
              child: const Text("Add to Cart"))
        ],
      ),
    );
  }
}
