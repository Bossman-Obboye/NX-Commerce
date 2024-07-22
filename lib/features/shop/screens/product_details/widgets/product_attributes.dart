import 'package:flutter/material.dart';
import 'package:nx_commerce/common/widgets/text/custom_price_text.dart';
import 'package:nx_commerce/common/widgets/text/product_text_tile.dart';
import 'package:nx_commerce/common/widgets/text/section_heading.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/sizes.dart';

class NxProductAttributes extends StatelessWidget {
  const NxProductAttributes({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return Column(
      /// -- Selected Attribute Pricing & Description
      children: [
        NxRoundedContainer(
          padding: const EdgeInsets.all(NxSizes.md),
          backgroundColor: isDarkMode ? NxColors.darkerGrey : NxColors.grey,
          child: Column(
            children: [
              /// Title, Price and Stock Status
              Row(
                children: [
                  const NxSectionHeading(
                    title: 'Variation',
                    showActionButton: false,
                  ),
                  const SizedBox(
                    width: NxSizes.spaceBtwItems,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const NxProductTitleText(
                            title: "Price : ",
                            isSmallSize: true,
                          ),

                          /// Actual Price
                          Text('\$25',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .apply(
                                      decoration: TextDecoration.lineThrough)),
                          const SizedBox(
                            width: NxSizes.spaceBtwItems,
                          ),

                          /// Sale Price
                          const NxProductPriceText(price: "20")
                        ],
                      ),

                      /// Stock
                      Row(
                        children: [
                          const NxProductTitleText(
                            title: "Stock : ",
                            isSmallSize: true,
                          ),
                          Text('In Stock',
                              style: Theme.of(context).textTheme.titleMedium)
                        ],
                      )
                    ],
                  ),
                ],
              ),

              /// -- Variation Description
              const NxProductTitleText(
                title:
                    'This is the Description of the Product and it can go up to max 4 line.',
                isSmallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: NxSizes.spaceBtwItems),

        /// -- Attributes
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NxSectionHeading(title: "Colors", showActionButton: false,),
            const SizedBox(height: NxSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                NxChoiceChip(text: 'Green', selected: false, onSelected: (value){},),
                NxChoiceChip(text: 'Blue', selected: true, onSelected: (value){},),
                NxChoiceChip(text: 'Yellow', selected: false, onSelected: (value){},),
                NxChoiceChip(text: 'Red', selected: false, onSelected: (value){},),
                NxChoiceChip(text: 'Brown', selected: false, onSelected: (value){},),
                NxChoiceChip(text: 'Teal', selected: false, onSelected: (value){},),
                NxChoiceChip(text: 'Black', selected: false, onSelected: (value){},),
                NxChoiceChip(text: 'Pink', selected: false, onSelected: (value){},),
              ],
            ),
          ],
        ),
         Column(
           crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NxSectionHeading(title: "Size", showActionButton: false,),
            const SizedBox(height: NxSizes.spaceBtwItems / 2),
            Wrap(
              spacing: 8,
              children: [
                NxChoiceChip(text: 'EU 34', selected: true, onSelected: (value){},),
                NxChoiceChip(text: 'EU 36', selected: false, onSelected: (value){},),
                NxChoiceChip(text: 'EU 38', selected: false, onSelected: (value){},),
                NxChoiceChip(text: 'EU 40', selected: false, onSelected: (value){},),
                NxChoiceChip(text: 'EU 42', selected: false, onSelected: (value){},),
                NxChoiceChip(text: 'EU 44', selected: false, onSelected: (value){},),
                NxChoiceChip(text: 'EU 46', selected: false, onSelected: (value){},),
                NxChoiceChip(text: 'EU 48', selected: false, onSelected: (value){},),
                NxChoiceChip(text: 'EU 50', selected: false, onSelected: (value){},),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
