import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/features/shop/controllers/products/image_controller.dart';
import 'package:nx_commerce/features/shop/models/product_model/product_model.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curve_edges/curve_edge_widget.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class NxProductImageSlider extends StatelessWidget {
  const NxProductImageSlider({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    final controller = Get.put(ImageController());
    final images = controller.getAllProductImages(product);

    return NxCurvedEdgeWidget(
      child: Container(
        color: isDarkMode ? NxColors.darkerGrey : NxColors.light,
        child: Stack(
          children: [
            /// -- Main Large Image
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(NxSizes.productImageRadius * 2),
                child: Center(
                  child: Obx(() {
                    final String image = controller.selectedProductImage.value;
                    return GestureDetector(
                      onTap: () => controller.showEnlargedImage(image),
                      child: CachedNetworkImage(
                        imageUrl: image,
                        progressIndicatorBuilder: (_, __, downloadProgress) => CircularProgressIndicator(value: downloadProgress.progress, color: NxColors.primary),
                      ),
                    );
                  }),
                ),
              ),
            ),

            /// -- Image Slider
            Positioned(
              right: 0,
              bottom: 30,
              left: NxSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  itemCount: images.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  separatorBuilder: ((_, __) => const SizedBox(
                        width: NxSizes.spaceBtwItems,
                      )),
                  itemBuilder: (_, index) => Obx(
                    () {
                      final bool imageSelected = controller .selectedProductImage.value == images[index];
                      return NxRoundedImage(
                      width: 80,
                      isNetworkImage: true,
                      imageUrl: images[index],
                      padding: const EdgeInsets.all(NxSizes.sm),
                      backgroundColor: isDarkMode ? NxColors.dark : NxColors.white,
                      onPressed: () => controller.selectedProductImage.value = images[index],
                      border: Border.all(color: imageSelected ? NxColors.primary : Colors.transparent),
                    );
                    },
                  ),
                ),
              ),
            ),

            /// -- Appbar Icons
            const NxAppBar(
              showBackArrow: true,
              actions: [
                NxCircularIcon(
                  iconData: Iconsax.heart5,
                  iconColor: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Padding(
// padding: EdgeInsets.all(NxSizes.defaultSpace),
// ),
