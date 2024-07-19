import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:nx_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:nx_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:nx_commerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_containers.dart';
import '../../../../common/widgets/text/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            NxPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- AppBar
                  const NxHomeAppBar(),

                  /// Spacing
                  const SizedBox(
                    height: NxSizes.spaceBtwSections,
                  ),

                  /// -- SearchBar
                  const NxSearchContainer(
                    text: "Search in Store",
                    icon: Iconsax.search_normal,
                  ),

                  /// Spacing
                  const SizedBox(
                    height: NxSizes.spaceBtwSections,
                  ),

                  /// -- Categories
                  Padding(
                    padding: const EdgeInsets.only(left: NxSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// -- Heading
                        NxSectionHeading(
                          title: "Popular Categories",
                          textColor: NxColors.white,
                          showActionButton: false,
                        ),
                        const SizedBox(
                          height: NxSizes.spaceBtwItems,
                        ),

                        /// -- Categories
                        const NxHomeCategories(),
                      ],
                    ),
                  )
                ],
              ),
            ),

            /// -- Body

            /// -- Promo Slider
            const Padding(
              padding: EdgeInsets.all(NxSizes.defaultSpace),
              child: Column(
                children: [
                  NxPromoSlider(banners: [NxImages.promoBanners1, NxImages.promoBanners2, NxImages.promoBanners3],),
                  SizedBox(
                    height: NxSizes.spaceBtwItems,
                  ),

                /// -- Popular Products
                NxProductCardVertical(),

                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}



class NxProductCardVertical extends StatelessWidget {
  const NxProductCardVertical({super.key});
  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return Container(
      padding: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(NxSizes.productImageRadius),
        color: isDarkMode ? NxColors.darkerGrey : NxColors.white,
      ),
child: Column(
  children: [
    /// --- Thumbnail
    NxRoundedContainer(
      height: 180,
      padding: const EdgeInsets.all(NxSizes.sm),
      backgroundColor: isDarkMode ? NxColors.dark : NxColors.light,
    )
  ],
),
    );
  }
}

