import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:nx_commerce/common/widgets/images/rounded_images.dart';
import 'package:nx_commerce/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:nx_commerce/common/widgets/text/brand_title_text_with_verification.dart';
import 'package:nx_commerce/common/widgets/text/custom_price_text.dart';
import 'package:nx_commerce/common/widgets/text/product_text_tile.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';

class NxProductCardHorizontal extends StatelessWidget {
  const NxProductCardHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return Container(
      width: 310,
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(NxSizes.productImageRadius),
        color: isDarkMode ? NxColors.darkerGrey : NxColors.softGrey,
      ),
      child: Row(
        children: [
          /// Thumbnail
          NxRoundedContainer(
            height: 120,
            padding: const EdgeInsets.all(NxSizes.sm),
            backgroundColor: isDarkMode ? NxColors.dark : NxColors.light,
            child: Stack(children: [
              const SizedBox(
                  height: 120,
                  width: 120,
                  child: NxRoundedImage(
                      imageUrl: NxImages.productImage1,
                      applyImageBorderRadius: true)),

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
              Positioned(
                  right: 0, child: NxFavouriteIcon(productId: 'product.id'))
            ]),
          ),

          /// Details
          SizedBox(
            height: 120,
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: NxSizes.sm, left: NxSizes.sm),
              child: Column(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NxProductTitleText(
                          title: 'Grey Nike Laptop Backpack',
                          isSmallSize: true),
                      SizedBox(height: NxSizes.spaceBtwItems / 2),
                      NxBrandTitleTextWithVerification(title: 'Nike'),
                    ],
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Pricing
                      const Flexible(
                          child: NxProductPriceText(price: '256.00')),

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
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
