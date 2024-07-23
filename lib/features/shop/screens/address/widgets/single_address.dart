import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';

class NxSingleAddress extends StatelessWidget {
  const NxSingleAddress({super.key, required this.selectedAddress});

  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return NxRoundedContainer(
      padding: const EdgeInsets.all(NxSizes.md),
      width: double.infinity,
      showBorder: true,
      backgroundColor: selectedAddress
          ? NxColors.primary.withOpacity(0.5)
          : Colors.transparent,
      borderColor: selectedAddress
          ? Colors.transparent
          : isDarkMode
              ? NxColors.darkerGrey
              : NxColors.grey,
      margin: const EdgeInsets.only(bottom: NxSizes.spaceBtwItems),
      child: Stack(
        children: [
          if (selectedAddress)
            Positioned(
              right: 5,
              top: 0,
              child: Icon(Iconsax.tick_circle5,
                  color: isDarkMode ? NxColors.light : NxColors.dark),
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('John Doe',
              maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style:Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: NxSizes.sm / 2),
              const Text('(+123) 456 7890', maxLines: 1, overflow: TextOverflow.ellipsis),
               const SizedBox(height: NxSizes.sm / 2),
              const Text('82356 Timmy Coves, South Liana, Maine, 87665, USA', softWrap: true),
            ],
          )
        ],
      ),
    );
  }
}
