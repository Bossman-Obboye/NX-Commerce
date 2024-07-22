import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/custom_shapes/curve_edges/curve_edge_widget.dart';
import '../../../../../common/widgets/icons/circular_icon.dart';
import '../../../../../common/widgets/images/rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class NxProductImageSlider extends StatelessWidget {
  const NxProductImageSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return NxCurvedEdgeWidget(
      child: Container(
        color: isDarkMode ? NxColors.darkerGrey : NxColors.light,
        child: Stack(
          children: [
            /// -- Main Large Image
            const SizedBox(
              height: 400,
              child: Padding(
                padding: EdgeInsets.all(NxSizes.productImageRadius * 2),
                child: Center(
                  child: Image(image: AssetImage(NxImages.productImage36)),
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
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: 6,
                  separatorBuilder: ((_, __) => const SizedBox(
                        width: NxSizes.spaceBtwItems,
                      )),
                  itemBuilder: (_, index) => NxRoundedImage(
                    backgroundColor:
                        isDarkMode ? NxColors.dark : NxColors.white,
                    width: 80,
                    border: Border.all(color: NxColors.primary),
                    padding: const EdgeInsets.all(NxSizes.sm),
                    imageUrl: NxImages.productImage36,
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
