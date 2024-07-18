import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';
import '../../utils/constants/sizes.dart';
import '../../utils/helpers/helpers.dart';


class NxVerticalImageText extends StatelessWidget {
  const NxVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = NxColors.white,
    this.backgroundColor,
    this.onTap,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return Padding(
      padding: const EdgeInsets.only(right: NxSizes.spaceBtwItems),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            /// Circular Icon
            Container(
              width: 56,
              height: 56,
              padding: const EdgeInsets.all(NxSizes.sm),
              decoration: BoxDecoration(
                  color: backgroundColor ??
                      (isDarkMode ? NxColors.black : NxColors.white),
                  borderRadius: BorderRadius.circular(100)),
              child: Center(
                child: Image(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                    color: isDarkMode ? NxColors.light : NxColors.dark),
              ),
            ),
            const SizedBox(
              height: NxSizes.spaceBtwItems * 0.5,
            ),

            /// -- Text
            SizedBox(
              width: 55,
              child: Text(
                title,
                style: Theme.of(context)
                    .textTheme
                    .labelMedium!
                    .apply(color: textColor),
                overflow: TextOverflow.ellipsis,
              ),
            )
          ],
        ),
      ),
    );
  }
}
