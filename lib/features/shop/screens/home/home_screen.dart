import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/features/shop/models/brand_category_model.dart';
import 'package:nx_commerce/features/shop/models/product_model.dart';
import 'package:nx_commerce/features/shop/screens/all_products/all_products.dart';
import 'package:nx_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:nx_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:nx_commerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:nx_commerce/products_to_upload.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/shimmer_effect/vertical_product_shimmer.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_containers.dart';
import '../../../../common/widgets/layout/grid_layout.dart';
import '../../../../common/widgets/products/product_card/product_card_vertical.dart';
import '../../../../common/widgets/text/section_heading.dart';
import '../../controllers/products/product_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProductController());
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
                  const NxPromoSlider(),
                  const SizedBox(
                    height: NxSizes.spaceBtwSections,
                  ),

                  // -- GridTitle
                  NxSectionHeading(
                    title: "Popular Products",
                    showActionButton: true,
                    btnOnPressed: () => Get.to(() => AllProductsScreen(
                          title: 'Popular Products',
                          futureMethod: controller.fetchAllFeaturedProducts(),
                        )),
                  ),

                  const SizedBox(
                    height: NxSizes.spaceBtwItems,
                  ),

                  /// -- Popular Products
                  Obx(
                    () {
                      if (controller.isLoading.value) {
                        return const NxVerticalProductShimmer();
                      }

                      if (controller.featuredProducts.isEmpty) {
                        return Center(
                            child: Text(
                          'No Data Found!',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ));
                      }
                      return NxGridLayout(
                        itemCount: controller.featuredProducts.length,
                        itemBuilder: (BuildContext _, index) =>
                            NxProductCardVertical(
                                product: controller.featuredProducts[index]),
                      );
                    },
                  )
                ],
              ),
            ),
            // ElevatedButton(
            //     onPressed: () async {
            //       print('>>>>>>>>>>>>>>>>>>>>>>>>>>>>>');
            //       await controller.uploadDummyProducts(productsTo);
            //       print('d***************************sd');
            //     },
            //     child: const Padding(
            //       padding: EdgeInsets.all(8.0),
            //       child: Text('Test'),
            //     )),
          ],
        ),
      ),
    );
  }
}

final test = BrandCategoryModel(brandId: '003', categoryId: '5');
