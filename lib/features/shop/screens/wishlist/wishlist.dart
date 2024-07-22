import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/common/widgets/icons/circular_icon.dart';
import 'package:nx_commerce/common/widgets/layout/grid_layout.dart';
import 'package:nx_commerce/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';

import '../home/home_screen.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NxAppBar(
        title:
            Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          NxCircularIcon(
            iconData: Iconsax.add,
            onPressed: () => Get.to(const HomeScreen()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(NxSizes.defaultSpace),
            child: Column(
              children: [
                NxGridLayout(
                    itemCount: 6,
                    itemBuilder: (_, index) => const NxProductCardVertical())
              ],
            ) ),
      ),
    );
  }
}
