import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/features/shop/controllers/products/cart_controller.dart';
import 'package:nx_commerce/features/shop/screens/product_details/product_details.dart';
import 'package:nx_commerce/utils/constants/enums.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';

class ProductAddToCartButtons extends StatelessWidget {
  const ProductAddToCartButtons({
    super.key, required this.product,
  });

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    return InkWell(
      onTap: (){
        // If the product have variations then show the product Details for variation selection.
        // Else add product to the cart.
        if(product.productType == ProductType.single.toString()){
          final cartItem = cartController.covertToCartItem(product, 1);
          cartController.addOneItemToCart(cartItem);
        }else {
          Get.to(()=> ProductDetailsScreen(product: product));
        }
      },
      child: Obx(
        () {
final productQuantityInCart = cartController.getProductQuantityInCart(product.id);
          return Container(
          decoration:  BoxDecoration(
            color: productQuantityInCart == 0 ? NxColors.dark : NxColors.primary,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(NxSizes.cardRadiusMd),
              bottomRight: Radius.circular(NxSizes.productImageRadius),
            ),
          ),
          child:  SizedBox(
            height: NxSizes.iconLg * 1.20,
            width: NxSizes.iconLg * 1.20,
            child: Center(
              child: productQuantityInCart == 0 ? const Icon(Iconsax.add, color: NxColors.white) : Text(productQuantityInCart.toString(), style:  Theme.of(context).textTheme.bodyLarge!.apply(color: NxColors.white),),
            ),
          ),
        );
        },
      ),
    );
  }
}
