import 'package:flutter/material.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/common/widgets/text/custom_price_text.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';

import '../../../../common/widgets/products/cart/cart_item.dart';
import '../../../../common/widgets/products/cart/product_add_remove_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NxAppBar(
          showBackArrow: true,
          title:
              Text("Cart", style: Theme.of(context).textTheme.headlineSmall)),
      body: Padding(
        padding: const EdgeInsets.all(NxSizes.defaultSpace),
        child: ListView.separated(
          itemCount: 10,
          shrinkWrap: true,
          separatorBuilder: ((_, __) =>
              const SizedBox(height: NxSizes.spaceBtwSections)),
          itemBuilder: ((_, index) => const Column(
                children: [
                  NxCartItem(),
                  SizedBox(height: NxSizes.spaceBtwSections),

                  /// -- Add, Remove Buttons
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      NxProductQuantityWithAddRemoveButton(showInitSpace: true),
                      NxProductPriceText(price: "256"),
                    ],
                  ),
                ],
              )),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(NxSizes.defaultSpace),
        child:
            ElevatedButton(onPressed: () {}, child: const Text("Checkout \$256.00")),
      ),
    );
  }
}
