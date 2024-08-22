import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/common/widgets/icons/circular_icon.dart';
import 'package:nx_commerce/features/shop/controllers/products/cart_controller.dart';
import 'package:nx_commerce/features/shop/models/product_model.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';

class NxBottomAddToCart extends StatelessWidget {
  const NxBottomAddToCart({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    final controller = CartController.instance;
    controller.updateAlreadyAddedProductCount(product);
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: NxSizes.defaultSpace, vertical: NxSizes.defaultSpace / 2),
      decoration: BoxDecoration(
        color: isDarkMode ? NxColors.darkerGrey : NxColors.light,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(NxSizes.cardRadiusLg),
          topRight: Radius.circular(NxSizes.cardRadiusLg),
        ),
      ),
      child: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                NxCircularIcon(
                  iconData: Iconsax.minus,
                  backgroundColor: NxColors.darkerGrey,
                  width: 40,
                  height: 40,
                  iconColor: NxColors.white,
                  onPressed: () => controller.productQuantityInCart.value < 1
                      ? null
                      : controller.productQuantityInCart.value -= 1,
                ),
                const SizedBox(width: NxSizes.spaceBtwItems),
                Text(controller.productQuantityInCart.value.toString(),
                    style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: NxSizes.spaceBtwItems),
                NxCircularIcon(
                  iconData: Iconsax.add,
                  backgroundColor: NxColors.black,
                  width: 40,
                  height: 40,
                  iconColor: NxColors.white,
                  onPressed: () => controller.productQuantityInCart.value += 1,
                ),
              ],
            ),
            ElevatedButton(
                onPressed: controller.productQuantityInCart.value < 1
                    ? null
                    : () => controller.addToCart(product),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(NxSizes.md),
                  backgroundColor: NxColors.black,
                  side: const BorderSide(color: NxColors.black),
                ),
                child: const Text("Add to Cart"))
          ],
        ),
      ),
    );
  }
}
