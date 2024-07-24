import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/features/shop/screens/all_products/all_products.dart';
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
                   NxSectionHeading(
                    title: "Popular Products",
                    showActionButton: true,
                    btnOnPressed: () => Get.to( () => const AllProducts()),
                  ),

                  const SizedBox(
                    height: NxSizes.spaceBtwItems,
                  ),

                  /// -- Popular Products
                  NxGridLayout(
                    itemCount: 58,
                    itemBuilder: (BuildContext _, index) {
                      final List<NxProductCardVertical> productsToDisplay = products.map((index) => NxProductCardVertical(image: index,)).toList();
                      return  productsToDisplay[index];
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

const  List<String> products = [
  NxImages.productImage1,
  NxImages.productImage2,
  NxImages.productImage3,
  NxImages.productImage4,
  NxImages.productImage5,
  NxImages.productImage6,
  NxImages.productImage7,
  NxImages.productImage8,
  NxImages.productImage9,
  NxImages.productImage10,
  NxImages.productImage11,
  NxImages.productImage12,
  NxImages.productImage13,
  NxImages.productImage14,
  NxImages.productImage15,
  NxImages.productImage16,
  NxImages.productImage17,
  NxImages.productImage18,
  NxImages.productImage19,
  NxImages.productImage20,
  NxImages.productImage21,
  NxImages.productImage22,
  NxImages.productImage23,
  NxImages.productImage24,
  NxImages.productImage25,
  NxImages.productImage26,
  NxImages.productImage27,
  NxImages.productImage28,
  NxImages.productImage29,
  NxImages.productImage30,
  NxImages.productImage31,
  NxImages.productImage32,
  NxImages.productImage33,
  NxImages.productImage34,
  NxImages.productImage35,
  NxImages.productImage36,
  NxImages.productImage37,
  NxImages.productImage38,
  NxImages.productImage39,
  NxImages.productImage40,
  NxImages.productImage41,
  NxImages.productImage42,
  NxImages.productImage43,
  NxImages.productImage44,
  NxImages.productImage45,
  NxImages.productImage46,
  NxImages.productImage47,
  NxImages.productImage48,
  NxImages.productImage49,
  NxImages.productImage50,
  NxImages.productImage51,
  NxImages.productImage52,
  NxImages.productImage53,
  NxImages.productImage54,
  NxImages.productImage55,
  NxImages.productImage56,
  NxImages.productImage57,
  NxImages.productImage58,
];
