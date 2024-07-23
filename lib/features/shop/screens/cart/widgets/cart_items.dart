
import 'package:flutter/material.dart';

import '../../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../../common/widgets/products/cart/product_add_remove_button.dart';
import '../../../../../common/widgets/text/custom_price_text.dart';
import '../../../../../utils/constants/sizes.dart';

class NxCartItems extends StatelessWidget {
  const NxCartItems({
    super.key, this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 2,
      shrinkWrap: true,
      separatorBuilder: ((_, __) =>
      const SizedBox(height: NxSizes.spaceBtwSections)),
      itemBuilder: ((_, index) =>  Column(
        children: [
          /// -- Cart Item
           const NxCartItem(),
         if(showAddRemoveButtons) const SizedBox(height: NxSizes.spaceBtwSections),

          /// -- Add, Remove Buttons
          if(showAddRemoveButtons) const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              NxProductQuantityWithAddRemoveButton(
                /// -- Extra Space
                showInitSpace: true,
              ),
              NxProductPriceText(price: "256"),
            ],
          ),
        ],
      )),
    );
  }
}
