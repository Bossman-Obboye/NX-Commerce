import 'package:flutter/material.dart';
import 'package:nx_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:nx_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:nx_commerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_containers.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/products/product_card/product_card_vertical.dart';
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
            const NxPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- AppBar
                  NxHomeAppBar(),

                  /// Spacing
                  SizedBox(
                    height: NxSizes.spaceBtwSections,
                  ),

                  /// -- SearchBar
                  NxSearchContainer(
                    text: "Search in Store",
                  ),

                  /// Spacing
                  SizedBox(
                    height: NxSizes.spaceBtwSections,
                  ),

                  /// -- Categories
                  Padding(
                    padding: EdgeInsets.only(left: NxSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// -- Heading
                        NxSectionHeading(
                          title: "Popular Categories",
                          textColor: NxColors.white,
                          showActionButton: false,
                        ),
                        SizedBox(
                          height: NxSizes.spaceBtwItems,
                        ),

                        /// -- Categories
                        NxHomeCategories(),
                      ],
                    ),
                  ),
                  SizedBox(height: NxSizes.spaceBtwSections),
                ],
              ),
            ),

            /// -- Body

            /// -- Promo Slider
            Padding(
              padding: const EdgeInsets.all(NxSizes.defaultSpace),
              child: Column(
                children: [
                  const NxPromoSlider(
                    banners: [
                      NxImages.promoBanners1,
                      NxImages.promoBanners2,
                      NxImages.promoBanners3
                    ],
                  ),
                  const SizedBox(
                    height: NxSizes.spaceBtwSections,
                  ),

                  // -- GridTitle
                  const NxSectionHeading(
                    title: "Popular Products",
                    showActionButton: true,
                  ),

                  const SizedBox(
                    height: NxSizes.spaceBtwItems,
                  ),

                  /// -- Popular Products
                  NxGridLayout(
                    itemCount: 2,
                    itemBuilder: (BuildContext _, index) {
                      return const NxProductCardVertical();
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
