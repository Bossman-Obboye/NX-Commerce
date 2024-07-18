import 'package:flutter/material.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/device/device_utility.dart';
import '../../../../utils/helpers/helpers.dart';

class NxSearchContainer extends StatelessWidget {
  const NxSearchContainer({
    super.key,
    this.showBackground = true,
    this.showBorder = true,
    required this.text,
    this.icon,
    this.onTap,
  });

  final bool showBackground, showBorder;
  final String text;
  final IconData? icon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: NxSizes.defaultSpace),
        child: Container(
          width: NxDeviceUtils.getScreenWidth(),
          padding: const EdgeInsets.all(NxSizes.md),
          decoration: BoxDecoration(
            color: showBackground
                ? isDarkMode
                    ? NxColors.dark
                    : NxColors.light
                : Colors.transparent,
            borderRadius: BorderRadius.circular(NxSizes.cardRadiusLg),
            border: showBorder ? Border.all(color: NxColors.grey) : null,
          ),
          child: Row(
            children: [
              Icon(icon, color: NxColors.darkerGrey),
              const SizedBox(
                width: NxSizes.spaceBtwItems,
              ),
              Text(text, style: Theme.of(context).textTheme.bodySmall)
            ],
          ),
        ),
      ),
    );
  }
}
