import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/features/shop/controllers/banner_controller.dart';
import 'package:nx_commerce/utils/shimmer_effect/nx_shimmer.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/images/rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';

class NxPromoSlider extends StatelessWidget {
  const NxPromoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    final BannerController controller = Get.put(BannerController());
    return Obx(
      () {
        // Loader
        if (controller.isLoading.value) {
          return const NxShimmerEffect(width: double.infinity, height: 190);
        }

        // No data found
        if (controller.banners.isEmpty) {
          return const Center(child: Text('No Data Found'));
        } else {
          return Column(
            children: [
              CarouselSlider(
                items: controller.banners
                    .map(
                      (banner) => NxRoundedImage(
                        imageUrl: banner.imageUrl,
                        isNetworkImage: true,
                        // onPressed: () => Get.toNamed(banner.targetScreen),
                      ),
                    )
                    .toList(),
                options: CarouselOptions(
                    viewportFraction: 1.2,
                    onPageChanged: (index, _) =>
                        controller.updatePageIndicator(index)),
              ),
              const SizedBox(height: NxSizes.spaceBtwItems),

              /// -- Promo display indicators
              Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.banners.length; i++)
                      NxRoundedContainer(
                        width: 20,
                        height: 4,
                        backgroundColor:
                            i == controller.carouselCurrentIndex.value
                                ? NxColors.primary
                                : NxColors.grey,
                        margin: const EdgeInsets.only(right: 10),
                      ),
                  ],
                ),
              ),
            ],
          );
        }
      },
    );
  }
}
