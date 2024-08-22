import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/common/widgets/loaders/animation_loader.dart';
import 'package:nx_commerce/common/widgets/navigation_bar/navigation_menu.dart';
import 'package:nx_commerce/features/shop/controllers/products/cart_controller.dart';
import 'package:nx_commerce/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:nx_commerce/features/shop/screens/checkout/checkout.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: NxAppBar(
          showBackArrow: true,
          title:
              Text("Cart", style: Theme.of(context).textTheme.headlineSmall)),
      body: Obx(
        () {
          final emptyWidget = NxAnimationLoaderWidget(
            text: 'Whoops! Cart is EMPTY',
            animation: NxImages.darkAppLogo,
            showAction: true,
            actionText: "Let's fill it",
            onActionPressed: () => const NavigationMenu(),
          );

          if (controller.cartItems.isEmpty) {
            return emptyWidget;
          } else {
            return const SingleChildScrollView(
              child: Padding(
                    padding: EdgeInsets.all(NxSizes.defaultSpace),

                    /// -- Items in Cart
                    child: NxCartItems(),
                  ),
            );
          }
        },
      ),

      /// -- Checkout Button
      bottomNavigationBar: controller.cartItems.isEmpty ? const SizedBox() : Padding(
        padding: const EdgeInsets.all(NxSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {
              Get.to(() => (const CheckoutScreen()));
            },
            child: Obx(()=> Text("Checkout \$${controller.totalCartPrice.value}"))),
      ),
    );
  }
}
