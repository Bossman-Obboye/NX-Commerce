
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:nx_commerce/features/shop/controllers/products/cart_controller.dart';

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
    final cartController = CartController.instance;
    return Obx(
      ()=> ListView.separated(
        itemCount: cartController.cartItems.length,
        shrinkWrap: true,
        separatorBuilder: ((_, __) =>
        const SizedBox(height: NxSizes.spaceBtwSections)),
        itemBuilder: ((_, index) =>  Obx(
            () {
              final item = cartController.cartItems[index];
              return Column(
            children: [
              /// -- Cart Item
               NxCartItem(cartItem : item),
             if(showAddRemoveButtons) const SizedBox(height: NxSizes.spaceBtwSections),

              /// -- Add, Remove Buttons
              if(showAddRemoveButtons)  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  NxProductQuantityWithAddRemoveButton(
                    /// -- Extra Space
                    showInitSpace: true, quantity: item.quantity,
                    add: () => cartController.addOneItemToCart(item),
                    remove: ()=> cartController.removeOneItemFromCart(item),
                  ),
                  NxProductPriceText(price: (item.price * item.quantity).toStringAsFixed(1)),
                ],
              ),
            ],
          );
            },
        )),
      ),
    );
  }
}
