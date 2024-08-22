import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/common/widgets/icons/circular_icon.dart';
import 'package:nx_commerce/common/widgets/layout/grid_layout.dart';
import 'package:nx_commerce/common/widgets/loaders/animation_loader.dart';
import 'package:nx_commerce/common/widgets/navigation_bar/navigation_menu.dart';
import 'package:nx_commerce/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:nx_commerce/features/shop/controllers/products/favourites_controller.dart';
import 'package:nx_commerce/features/shop/models/product_model.dart';
import 'package:nx_commerce/features/shop/screens/home/home_screen.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';

import '../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../../utils/shimmer_effect/vertical_product_shimmer.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FavouritesController());
    return Scaffold(
      appBar: NxAppBar(
        title:
            Text("Wishlist", style: Theme.of(context).textTheme.headlineMedium),
        actions: [
          NxCircularIcon(
            iconData: Iconsax.add,
            onPressed: () => Get.to(() => const NavigationMenu()),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(NxSizes.defaultSpace),

            /// Products Grid
            child: Obx(
              () => FutureBuilder(
                  future: controller.favoriteProducts(),
                  builder: (context, snapshot) {
                    /// Nothing Found Widget
                    final nothingFoundWidget = NxAnimationLoaderWidget(
                        text: 'Whoops! Wishlist is Empty...',
                        animation: NxImages.darkAppLogo,
                        showAction: true,
                        actionText: "Let's add some",
                        onActionPressed: () =>
                            Get.off(() => const HomeScreen()));

                    ///Check the state of the FutureBuilder snapshot
                    const loader = NxVerticalProductShimmer(itemCount: 6);
                    final widget = NxCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot,
                        loader: loader,
                        nothingFound: nothingFoundWidget);

                    // Return appropriate widget base on snapshot status
                    if (widget != null) return widget;

                    final List<ProductModel> products = snapshot.data!;

                    return NxGridLayout(
                      itemCount: products.length,
                      itemBuilder: (_, index) => NxProductCardVertical(
                        product: products[index],
                      ),
                    );
                  }),
            )),
      ),
    );
  }
}
