import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/features/shop/controllers/products/cart_controller.dart';
import 'package:nx_commerce/features/shop/screens/cart/cart_screen.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/helpers/helpers.dart';

class NxCartCounterIcon extends StatelessWidget {
  const NxCartCounterIcon({
    super.key,
    this.iconColor,
    this.counterBgColor,
    this.counterTextColor,
  });

  final Color? iconColor, counterBgColor, counterTextColor;

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return Stack(
      children: [
        /// -- Cart Icon
        IconButton(
          onPressed: () => Get.to(() => const CartScreen()),
          icon: const Icon(Iconsax.shopping_bag),
          color: iconColor ?? (isDarkMode ? NxColors.darkGrey : NxColors.black),
        ),

        /// -- Display Card for number of items in Cart
        Positioned(
          right: 0,
          child: Container(
            width: 18,
            height: 18,
            decoration: BoxDecoration(
              color: counterBgColor ??
                  (isDarkMode ? NxColors.white : NxColors.black),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Center(
              child: Obx(
    ()=> Text(
                  controller.noOfCartItems.value.toString(),
                  style: Theme.of(context).textTheme.labelLarge!.apply(
                      color: counterTextColor ??
                          (isDarkMode ? NxColors.black : NxColors.white),
                      fontSizeFactor: 0.8),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
