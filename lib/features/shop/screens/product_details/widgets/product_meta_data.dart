import 'package:flutter/material.dart';
import 'package:nx_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:nx_commerce/common/widgets/images/circular_image.dart';
import 'package:nx_commerce/common/widgets/text/brand_title_text_with_verification.dart';
import 'package:nx_commerce/common/widgets/text/custom_price_text.dart';
import 'package:nx_commerce/common/widgets/text/product_text_tile.dart';
import 'package:nx_commerce/features/shop/controllers/products/product_controller.dart';
import 'package:nx_commerce/features/shop/models/product_model.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/constants/enums.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helpers.dart';

class NxProductMetaData extends StatelessWidget {
  const NxProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final controller = ProductController.instance;
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    final salePercentage =
        controller.calculateSalePercentage(product.price, product.salePrice);

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
              padding: const EdgeInsets.symmetric(
                  horizontal: NxSizes.sm, vertical: NxSizes.xs),
              child: Text('$salePercentage%',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .apply(color: NxColors.black)),
            ),
            const SizedBox(
              width: NxSizes.spaceBtwItems,
            ),

            /// -- Price
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              Text('\$${product.price}',
                  style: Theme.of(context)
                      .textTheme
                      .titleSmall!
                      .apply(decoration: TextDecoration.lineThrough)),
            if (product.productType == ProductType.single.toString() &&
                product.salePrice > 0)
              const SizedBox(width: NxSizes.spaceBtwItems),
            NxProductPriceText(
                price: controller.getProductPrice(product), isLarge: true),
          ],
        ),
        const SizedBox(height: NxSizes.spaceBtwItems / 1.5),

        /// -- Title
        NxProductTitleText(title: product.title),
        const SizedBox(height: NxSizes.spaceBtwItems / 1.5),

        /// -- Stock Status
        Row(
          children: [
            const NxProductTitleText(title: "Status "),
            const SizedBox(
              width: NxSizes.spaceBtwItems,
            ),
            Text(controller.getProductStockStatus(product.stock),
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: NxSizes.spaceBtwItems / 1.5),

        /// -- Brand
        Row(
          children: [
            NxCircularImage(
              width: 32,
              height: 32,
              isNetworkImage:  product.brand != null,
              image: product.brand != null ? product.brand!.image : '',
              overlayColor: isDarkMode ? NxColors.white : NxColors.black,
            ),
            NxBrandTitleTextWithVerification(
                title: product.brand != null ? product.brand!.name : '',
                brandTextSize: TextSizes.medium),
          ],
        )
      ],
    );
  }
}
