import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/features/shop/models/brand_model.dart';
import 'package:nx_commerce/features/shop/screens/brand/brand_products.dart';
import 'package:nx_commerce/utils/shimmer_effect/nx_shimmer.dart';

import 'brand_card.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helpers.dart';
import '../custom_shapes/containers/rounded_container.dart';

class NxBrandShowcase extends StatelessWidget {
  const NxBrandShowcase({
    super.key,
    required this.images, required this.brand,
  });
  final BrandModel brand;
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProductsScreen(brand: brand)),
      child: NxRoundedContainer(
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
            NxBrandCard(showBorder: false, brand: brand),
            const SizedBox(height: NxSizes.spaceBtwItems),

            /// Brand Top 3 Product Images
            Row(
              children: images
                  .map((image) => brandTopProductImageWidget(image, context))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, BuildContext context) {
    return Expanded(
      child: NxRoundedContainer(
        height: 100,
        backgroundColor: NxHelpers.isDarkMode(context)
            ? NxColors.darkerGrey
            : NxColors.light,
        margin: const EdgeInsets.only(right: NxSizes.sm),
        padding: const EdgeInsets.all(NxSizes.md),
        child:  CachedNetworkImage(
            fit: BoxFit.contain,
            imageUrl: image,
            progressIndicatorBuilder: (context,url, downloadProgress) => const NxShimmerEffect(width: 100, height: 100),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
        ),
    );
  }
}
