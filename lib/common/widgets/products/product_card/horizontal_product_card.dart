import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:nx_commerce/common/widgets/images/rounded_images.dart';
import 'package:nx_commerce/common/widgets/products/favourite_icon/favourite_icon.dart';
import 'package:nx_commerce/common/widgets/text/brand_title_text_with_verification.dart';
import 'package:nx_commerce/common/widgets/text/custom_price_text.dart';
import 'package:nx_commerce/common/widgets/text/product_text_tile.dart';
import 'package:nx_commerce/features/shop/models/product_model.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';

import '../../../../features/shop/controllers/products/product_controller.dart';
import '../../../../utils/constants/enums.dart';

class NxProductCardHorizontal extends StatelessWidget {
  const NxProductCardHorizontal({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage =
    controller.calculateSalePercentage(product.price, product.salePrice);

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
               SizedBox(
                  height: 120,
                  width: 120,
                  child: NxRoundedImage(
                    isNetworkImage: true,
                      imageUrl: product.thumbnail,
                      applyImageBorderRadius: true)),

              /// -- Sales Tag
              if(salePercentage != null)
              Positioned(
                top: 12,
                child: NxRoundedContainer(
                  radius: NxSizes.sm,
                  backgroundColor: NxColors.secondary.withOpacity(0.8),
                  padding: const EdgeInsets.symmetric(
                      horizontal: NxSizes.sm, vertical: NxSizes.xs),
                  child: Text(
                    "$salePercentage%",
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .apply(color: NxColors.black),
                  ),
                ),
              ),

              /// Favourite Icon Button
              Positioned(
                  right: 0, child: NxFavouriteIcon(productId: product.id))
            ]),
          ),

          /// Details
          SizedBox(
            height: 120,
            width: 172,
            child: Padding(
              padding: const EdgeInsets.only(top: NxSizes.sm, left: NxSizes.sm),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      NxProductTitleText(
                          title: product.title,
                          isSmallSize: true),
                      const SizedBox(height: NxSizes.spaceBtwItems / 2),
                      NxBrandTitleTextWithVerification(title: product.brand!.name),
                    ],
                  ),
                  const Spacer(),

                  /// Price Row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// -- Price
                      Flexible(
                        child: Column(
                          children: [
                            if (product.productType ==
                                ProductType.single.toString() &&
                                product.salePrice > 0)
                              Padding(
                                padding: const EdgeInsets.only(left: NxSizes.sm),
                                child: Text(
                                  '\$${product.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelMedium!
                                      .apply(decoration: TextDecoration.lineThrough),
                                ),
                              ),

                            /// Price, Show sale price as main price if sale exist.
                            Padding(
                              padding: const EdgeInsets.only(left: NxSizes.sm),
                              child: NxProductPriceText(
                                  price: controller.getProductPrice(product)),
                            ),
                          ],
                        ),
                      ),

                      /// -- Add to Cart Button
                      Container(
                        decoration: const BoxDecoration(
                          color: NxColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(NxSizes.cardRadiusMd),
                            bottomRight: Radius.circular(NxSizes.productImageRadius),
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
          )
        ],
      ),
    );
  }
}
