import "package:flutter/material.dart";
import "package:iconsax/iconsax.dart";
import "package:nx_commerce/common/widgets/icons/circular_icon.dart";
import "package:nx_commerce/common/widgets/images/rounded_images.dart";
import "package:nx_commerce/common/widgets/text/product_text_tile.dart";

import "../../../../utils/constants/colors.dart";
import "../../../../utils/constants/image_strings.dart";
import "../../../../utils/constants/sizes.dart";
import "../../../../utils/helpers/helpers.dart";
import "../../custom_shapes/containers/rounded_container.dart";
import "../../text/custom_price_text.dart";

class NxProductCardVertical extends StatelessWidget {
  const NxProductCardVertical({super.key});
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);

    /// -- Container with side padding,color, edges, radius and shadow
    return GestureDetector(
      onTap: null,
      child: Container(
        width: 180,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(NxSizes.productImageRadius),
          color: isDarkMode ? NxColors.darkerGrey : NxColors.white,
        ),
        child: Column(
          children: [
            /// -- Thumbnail, wishlist button, discount card
            NxRoundedContainer(
              height: 180,
              padding: const EdgeInsets.all(NxSizes.xs / 2),
              backgroundColor: isDarkMode ? NxColors.dark : NxColors.light,
              child: Stack(children: [
                /// Thumbnail
                const NxRoundedImage(
                  imageUrl: NxImages.productImage1,
                  applyImageBorderRadius: true,
                ),

                /// -- Sales Tag
                Positioned(
                  top: 12,
                  child: NxRoundedContainer(
                    radius: NxSizes.sm,
                    backgroundColor: NxColors.secondary.withOpacity(0.5),
                    padding: const EdgeInsets.symmetric(
                        horizontal: NxSizes.sm, vertical: NxSizes.xs),
                    child: Text(
                      "25%",
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .apply(color: NxColors.black),
                    ),
                  ),
                ),

                /// Favourite Icon Button
                const Positioned(
                  right: 0,
                  child: NxCircularIcon(
                    iconData: Iconsax.heart5,
                    iconColor: Colors.red,
                  ),
                )
              ]),
            ),

            /// -- Details
            Padding(
              padding: const EdgeInsets.only(
                left: NxSizes.sm,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NxProductTitleText(
                    title:
                        "Grey laptop backpack. Resist water and other fluid - original",
                    isSmallSize: true,
                  ),
                  const SizedBox(
                    height: NxSizes.spaceBtwItems / 2,
                  ),
                  Row(
                    children: [
                      Text(
                        "Nike",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                      const SizedBox(
                        width: NxSizes.xs,
                      ),
                      const Icon(Iconsax.verify5,
                          color: NxColors.primary, size: NxSizes.iconXs)
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(
                left: NxSizes.sm,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  /// -- Price
                  const NxProductPriceText(
                    price: "35.00",
                  ),

                  /// -- Add to Cart Button
                  Container(
                    decoration: const BoxDecoration(
                      color: NxColors.dark,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(NxSizes.cardRadiusMd),
                        bottomRight:
                            Radius.circular(NxSizes.productImageRadius),
                      ),
                    ),
                    child: const SizedBox(
                      height: NxSizes.iconLg * 1.20,
                      width: NxSizes.iconLg * 1.20,
                      child: Center(
                        child: Icon(Iconsax.add, color: NxColors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
