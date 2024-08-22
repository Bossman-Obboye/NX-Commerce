import 'package:flutter/material.dart';
import 'package:nx_commerce/features/shop/models/cart_item_model.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../images/rounded_images.dart';
import '../../text/brand_title_text_with_verification.dart';
import '../../text/product_text_tile.dart';

class NxCartItem extends StatelessWidget {
  const NxCartItem({super.key, required this.cartItem});

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        NxRoundedImage(
          height: 60,
          width: 60,
          isNetworkImage: true,
          imageUrl: cartItem.image ?? '',
          padding: const EdgeInsets.all(NxSizes.sm),
          backgroundColor: NxHelpers.isDarkMode(context)
              ? NxColors.darkerGrey
              : NxColors.light,
        ),

        /// -- Title, Price & Size
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              NxBrandTitleTextWithVerification(title: cartItem.brandName ?? ''),
              Flexible(
                  child:
                      NxProductTitleText(title: cartItem.title, maxLines: 1)),

              /// -- Attribute
              Text.rich(
                TextSpan(
                  children: (cartItem.selectedVariation ?? {}).entries.map(
                        (e) => TextSpan(children: [
                          TextSpan(
                              text: "${e.key} ",
                              style: Theme.of(context).textTheme.bodySmall,),
                          TextSpan(
                              text: "${e.value} ",
                              style: Theme.of(context).textTheme.bodyLarge),
                        ]),
                      ).toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
