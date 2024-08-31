import 'package:flutter/material.dart';
import 'package:nx_commerce/common/widgets/images/circular_image.dart';

import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helpers.dart';


class NxVerticalImageText extends StatelessWidget {
  const NxVerticalImageText({
    super.key,
    required this.image,
    required this.title,
    this.textColor = NxColors.white,
    this.backgroundColor,
    this.onTap, this.isNetworkImage = true,
  });

  final String image, title;
  final Color textColor;
  final Color? backgroundColor;
  final void Function()? onTap;
  final bool isNetworkImage;

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
           NxCircularImage(image: image, fit: BoxFit.contain, padding: NxSizes.sm *1.4, isNetworkImage: isNetworkImage,backgroundColor: backgroundColor),
            const SizedBox(
              height: NxSizes.spaceBtwItems * 0.5,
            ),

            /// -- Text
            SizedBox(
              width: 55,
              child: Text(
                title,
                textAlign: TextAlign.center,
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
