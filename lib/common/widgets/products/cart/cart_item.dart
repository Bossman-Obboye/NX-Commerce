
import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/image_strings.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helpers.dart';
import '../../images/rounded_images.dart';
import '../../text/brand_title_text_with_verification.dart';
import '../../text/product_text_tile.dart';



class NxCartItem extends StatelessWidget {
  const NxCartItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /// Image
        NxRoundedImage(
          imageUrl: NxImages.productImage1,
          height: 60,
          width: 60,
          padding: const EdgeInsets.all(NxSizes.sm),
          backgroundColor: NxHelpers.isDarkMode(context) ? NxColors.darkerGrey : NxColors.light,
        ),

        /// -- Title, Price & Size
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const NxBrandTitleTextWithVerification(title: "Nike"),
              const Flexible(child: NxProductTitleText(title: "Grey Laptop backpack", maxLines: 1)),

              /// -- Attribute
              RichText(text: TextSpan(
                  children: [
                    TextSpan(text: "Color ", style:  Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: "Green ", style:  Theme.of(context).textTheme.bodyLarge),
                    TextSpan(text: "Size ", style:  Theme.of(context).textTheme.bodySmall),
                    TextSpan(text: "UK 08 ", style:  Theme.of(context).textTheme.bodyLarge),
                  ]
              )),
            ],
          ),
        ),
      ],
    );
  }
}
