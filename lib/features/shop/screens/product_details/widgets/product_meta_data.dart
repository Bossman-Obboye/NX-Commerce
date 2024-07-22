import 'package:flutter/material.dart';
import 'package:nx_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:nx_commerce/common/widgets/images/circular_image.dart';
import 'package:nx_commerce/common/widgets/text/brand_title_text_with_verification.dart';
import 'package:nx_commerce/common/widgets/text/custom_price_text.dart';
import 'package:nx_commerce/common/widgets/text/product_text_tile.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/constants/enums.dart';

import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helpers.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// -- Price & Sale Price
        Row(
          children: [
            /// -- Sale Tag
            NxRoundedContainer(
              radius: NxSizes.sm,
              backgroundColor: NxColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: NxSizes.sm, vertical: NxSizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: NxColors.black)),
            ),
            const SizedBox(width: NxSizes.spaceBtwItems,),

            /// -- Price
            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: NxSizes.spaceBtwItems,),
            const NxProductPriceText(price:'\$250', isLarge: true,),
          ],
        ),
        const SizedBox(height: NxSizes.spaceBtwItems / 1.5),

        /// -- Title
        const NxProductTitleText(title: "Grey Nike Laptop Bag"),
        const SizedBox(height: NxSizes.spaceBtwItems / 1.5),

        /// -- Stock Status
        Row(
          children: [
            const NxProductTitleText(title: "Status "),
            const SizedBox(width: NxSizes.spaceBtwItems,),
            Text('In Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: NxSizes.spaceBtwItems / 1.5),

        /// -- Brand
        Row(
          children: [
            NxCircularImage(image: NxImages.nikeBrand, width: 32, height: 32, overlayColor: isDarkMode ? NxColors.white : NxColors.black,),
            const NxBrandTitleTextWithVerification(title: "Nike", brandTextSize: TextSizes.medium),
          ],
        )
      ],
    );
  }
}
