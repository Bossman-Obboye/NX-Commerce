import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../common/widgets/images/rounded_images.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/home_controller.dart';

class NxPromoSlider extends StatelessWidget {
  const NxPromoSlider({
    super.key, required this.banners,
  });

  final List<String> banners;
  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.put(HomeController());
    return Column(
      children: [
        CarouselSlider(
          items: banners.map((url)=> NxRoundedImage(imageUrl: url)).toList(),
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
              for (int i = 0; i < banners.length; i++)
                 NxRoundedContainer(
                  width: 20,
                  height: 4,
                  backgroundColor: i == controller.carouselCurrentIndex.value ? NxColors.primary : NxColors.grey,
                  margin: const EdgeInsets.only(right: 10),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
