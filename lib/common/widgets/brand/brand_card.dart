import 'package:flutter/material.dart';

import '../custom_shapes/containers/rounded_container.dart';
import '../images/circular_image.dart';
import '../text/brand_title_text_with_verification.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/enums.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helpers.dart';

class NxBrandCard extends StatelessWidget {
  const NxBrandCard({
    super.key,
    this.showBorder = false, this.onTap,
  });
  final bool showBorder;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: NxRoundedContainer(
        padding: const EdgeInsets.all(NxSizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            /// -- Icon
            Flexible(
              child: NxCircularImage(
                image: NxImages.clothIcon,
                backgroundColor: Colors.transparent,
                overlayColor: NxHelpers.isDarkMode(context)
                    ? NxColors.white
                    : NxColors.black,
              ),
            ),
            const SizedBox(
              width: NxSizes.spaceBtwItems / 2,
            ),

            /// -- Text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const NxBrandTitleTextWithVerification(
                    title: 'Nike',
                    brandTextSize: TextSizes.large,
                  ),
                  Text(
                    "256 products",
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
