import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "package:nx_commerce/common/widgets/icons/circular_icon.dart";
import "package:nx_commerce/common/widgets/images/rounded_images.dart";
import "package:nx_commerce/common/widgets/text/brand_title_text_with_verification.dart";
import "package:nx_commerce/common/widgets/text/product_text_tile.dart";
import "package:nx_commerce/features/shop/controllers/product_controller.dart";
import "package:nx_commerce/features/shop/models/product_model/product_model.dart";
import "package:nx_commerce/features/shop/screens/product_details/product_details.dart";
import "package:nx_commerce/utils/constants/enums.dart";
import "../../../../utils/constants/colors.dart";
import "../../../../utils/constants/sizes.dart";
import "../../../../utils/helpers/helpers.dart";
import "../../custom_shapes/containers/rounded_container.dart";
import "../../text/custom_price_text.dart";

class NxProductCardVertical extends StatelessWidget {
  const NxProductCardVertical({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    final controller = ProductController.instance;
    final salePercentage = controller.calculateSalePercentage(product.price, product.salePrice);

    /// -- Container with side padding,color, edges, radius and shadow
    return GestureDetector(
      onTap: () => Get.to(() => ProductDetailsScreen(product: product)),
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
              width: 180,
              padding: const EdgeInsets.all(NxSizes.sm),
              backgroundColor: isDarkMode ? NxColors.dark : NxColors.light,
              child: Stack(children: [
                /// Thumbnail image
                 Center(
                   child: NxRoundedImage(
                    imageUrl: product.thumbnail,
                    isNetworkImage: true,
                    applyImageBorderRadius: true
                                   )
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
                      "$salePercentage%",
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
             Padding(
              padding: const EdgeInsets.only(
                left: NxSizes.sm
              ),
              child: SizedBox(
                // This is to make the Colum full width
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    NxProductTitleText(
                      title: product.title,
                      isSmallSize: true,
                    ),
                    const SizedBox(
                      height: NxSizes.spaceBtwItems / 2,
                    ),
                    NxBrandTitleTextWithVerification(
                      title: product.brand!.name
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
                 Flexible(
                   child: Column(
                     children: [
                       if(product.productType == ProductType.single.toString() && product.salePrice > 0)
                         Padding(
                           padding: const EdgeInsets.only(
                             left: NxSizes.sm
                           ),
                           child: Text(
                             '\$${product.price}',
                             style: Theme.of(context).textTheme.labelMedium!.apply(decoration: TextDecoration.lineThrough),
                           ),
                         ),

                       /// Price, Show sale price as main price if sale exist.
                       Padding(
                        padding: const EdgeInsets.only(
                                     left: NxSizes.sm
                                   ),
                        child: NxProductPriceText(
                          price:  controller.getProductPrice(product)
                        ),
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
