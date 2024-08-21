import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../features/shop/controllers/products/favourites_controller.dart';
import '../../icons/circular_icon.dart';

class  NxFavouriteIcon extends StatelessWidget {
  const  NxFavouriteIcon({super.key, required this.productId});

  final String productId;
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Obx(
      () =>  NxCircularIcon(
        iconData: controller.isFavourite(productId) ? Iconsax.heart5 : Iconsax.heart,
        iconColor: controller.isFavourite(productId) ? Colors.red : null,
        onPressed: () => controller.toggleFavoriteProduct(productId),
      ),
    );
  }
}
