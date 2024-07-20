import "package:flutter/material.dart";
import "package:nx_commerce/common/widgets/images/rounded_images.dart";

import "../../../../utils/constants/colors.dart";
import "../../../../utils/constants/sizes.dart";
import "../../../../utils/helpers/helpers.dart";
import "../../custom_shapes/containers/rounded_container.dart";



class NxProductCardVertical extends StatelessWidget {
  const NxProductCardVertical({super.key});
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return Container(
      width: 180,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(NxSizes.productImageRadius),
        color: isDarkMode ? NxColors.darkerGrey : NxColors.white,
      ),
      child: Column(
        children: [
          /// --- Thumbnail
          NxRoundedContainer(
            height: 180,
            padding: const EdgeInsets.all(NxSizes.sm),
            backgroundColor: isDarkMode ? NxColors.dark : NxColors.light,
            child: Stack(
              children: [
                /// Thumbnail, wishlist button, discount card

               NxRoundedImage(imageUrl: imageUrl)

              ],
            ),
          ),
        ],
      ),
    );
  }
}