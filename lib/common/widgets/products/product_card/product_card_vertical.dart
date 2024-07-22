import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "package:nx_commerce/common/widgets/icons/circular_icon.dart";
import "package:nx_commerce/common/widgets/images/rounded_images.dart";
import "package:nx_commerce/common/widgets/text/brand_title_text_with_verification.dart";
import "package:nx_commerce/common/widgets/text/product_text_tile.dart";
import "package:nx_commerce/features/shop/screens/product_details/product_details.dart";
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
      onTap: () => Get.to(() => const ProductDetailsScreen()),
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
              height: 172,
              padding: const EdgeInsets.all(NxSizes.sm),
              backgroundColor: isDarkMode ? NxColors.dark : NxColors.light,
              child: Stack(children: [
                /// Thumbnail image
                const NxRoundedImage(
                  imageUrl: NxImages.productImage36,
                  applyImageBorderRadius: true,
                ),

                /// -- Sales Tag
                Positioned(
                  top: 12,
                  child: NxRoundedContainer(
                    radius: NxSizes.sm,
                    backgroundColor: NxColors.secondary.withOpacity(0.8),
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

            const SizedBox(height: NxSizes.spaceBtwItems / 2,),

            /// -- Details
            const Padding(
              padding: EdgeInsets.only(
                left: NxSizes.sm,
              ),
              child: SizedBox(
                // This is to make the Colum full width
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NxProductTitleText(
                      title:
                          "Grey laptop backpack. Resist water and other fluid - original",
                      isSmallSize: true,
                    ),
                    SizedBox(
                      height: NxSizes.spaceBtwItems / 2,
                    ),
                    NxBrandTitleTextWithVerification(
                      title: 'Nike',
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),

            /// Price Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// -- Price
                const Padding(
                  padding:EdgeInsets.only(
              left: NxSizes.sm,
            ),
                  child: NxProductPriceText(
                    price: "35.00",
                  ),
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
          ],
        ),
      ),
    );
  }
}
