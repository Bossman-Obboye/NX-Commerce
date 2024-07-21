import 'package:flutter/material.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';

import 'brand_card.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helpers.dart';
import '../custom_shapes/containers/rounded_container.dart';

class NxBrandShowcase extends StatelessWidget {
  const NxBrandShowcase({
    super.key,
    required this.images,
  });

  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return NxRoundedContainer(
      showBorder: true,
      borderColor: NxColors.darkGrey,
      backgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(NxSizes.md),
      margin: const EdgeInsets.only(
        bottom: NxSizes.spaceBtwItems,
      ),
      child: Column(
        children: [
          /// -- Brand with Products Count
          const NxBrandCard(showBorder: false),
          const SizedBox(height: NxSizes.spaceBtwItems),

          /// Brand Top 3 Product Images
          Row(
            children: images
                .map((image) => brandToProductImageWidget(image, context))
                .toList(),
          ),
        ],
      ),
    );
  }

  Expanded brandToProductImageWidget(String image, BuildContext context) {
    return Expanded(
      child: NxRoundedContainer(
        height: 100,
        backgroundColor: NxHelpers.isDarkMode(context)
            ? NxColors.darkerGrey
            : NxColors.light,
        margin: const EdgeInsets.only(right: NxSizes.sm),
        padding: const EdgeInsets.all(NxSizes.md),
        child: Image(
          fit: BoxFit.contain,
          image: AssetImage(image),
        ),
      ),
    );
  }
}
