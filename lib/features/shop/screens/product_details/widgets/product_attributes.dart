import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/common/widgets/text/custom_price_text.dart';
import 'package:nx_commerce/common/widgets/text/product_text_tile.dart';
import 'package:nx_commerce/common/widgets/text/section_heading.dart';
import 'package:nx_commerce/features/shop/controllers/products/variation_controller.dart';
import 'package:nx_commerce/features/shop/models/product_model/product_model.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';

import '../../../../../common/widgets/chips/choice_chip.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/sizes.dart';

class NxProductAttributes extends StatelessWidget {
  const NxProductAttributes({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    final controller = Get.put(VariationController());
    return Obx(
        () => Column(
        /// -- Selected Attribute Pricing & Description
        children: [
          // Display variation price and stock when some variation is selected.
          if (controller.selectedVariation.value.id.isNotEmpty)
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
                              if(controller.selectedVariation.value.salePrice > 0)
                              Text('\$${controller.selectedVariation.value.price}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .apply(
                                          decoration:
                                              TextDecoration.lineThrough)),
                              const SizedBox(
                                width: NxSizes.spaceBtwItems,
                              ),

                              /// Sale Price
                              NxProductPriceText(price: controller.getVariationPrice())
                            ],
                          ),

                          /// Stock
                          Row(
                            children: [
                              const NxProductTitleText(
                                title: "Stock : ",
                                isSmallSize: true,
                              ),
                              Text(controller.variationStockStatus.value,
                                  style: Theme.of(context).textTheme.titleMedium)
                            ],
                          )
                        ],
                      ),
                    ],
                  ),

                  /// -- Variation Description
                  NxProductTitleText(
                    title:
                         controller.selectedVariation.value.description ?? '',
                    isSmallSize: true,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          if (controller.selectedVariation.value.id.isNotEmpty)
            const SizedBox(height: NxSizes.spaceBtwItems),

          /// -- Attributes
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: product.productAttributes!
                .map((attribute) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        NxSectionHeading(
                            title: attribute.name ?? '', showActionButton: false),
                        const SizedBox(height: NxSizes.spaceBtwItems / 2),
                        Obx(
                          () => Wrap(
                            spacing: 8,
                            children: attribute.values!.map(
                              (attributeValue) {
                                final isSelected = controller
                                        .selectedAttributes[attribute.name] ==
                                    attributeValue;
                                final available = controller
                                    .getAttributesAvailabilityInVariation(
                                        product.productVariations!,
                                        attribute.name!)
                                    .contains(attributeValue);

                                return NxChoiceChip(
                                  text: attributeValue,
                                  selected: isSelected,
                                  onSelected: available
                                      ? (selected) {
                                          if (selected && available) {
                                            controller.onAttributeSelected(
                                                product,
                                                attribute.name ?? '',
                                                attributeValue);
                                          }
                                        }
                                      : null,
                                );
                              },
                            ).toList(),
                          ),
                        ),
                      ],
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}
