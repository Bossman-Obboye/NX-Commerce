import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/common/widgets/appbar/tab_bar.dart';
import 'package:nx_commerce/common/widgets/brand/brand_card.dart';
import 'package:nx_commerce/common/widgets/custom_shapes/containers/search_containers.dart';
import 'package:nx_commerce/common/widgets/layout/grid_layout.dart';
import 'package:nx_commerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:nx_commerce/common/widgets/text/section_heading.dart';
import 'package:nx_commerce/features/shop/controllers/brand_controller.dart';
import 'package:nx_commerce/features/shop/controllers/category_controller.dart';
import 'package:nx_commerce/features/shop/screens/brand/all_brands.dart';
import 'package:nx_commerce/features/shop/screens/brand/brand_products.dart';
import 'package:nx_commerce/features/shop/screens/store/widgets/category_tab.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/shimmer_effect/brand_shimmer.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = Get.put(BrandController());
    final categories = CategoryController.instance.featuredCategories;
    return DefaultTabController(
      length: categories.length,
      child: Scaffold(
        /// -- Appbar
        appBar: NxAppBar(
          /// -- Title
          title:
              Text("Store", style: Theme.of(context).textTheme.headlineMedium),
          actions: const [
            /// -- Icons [cart with counter]
            NxCartCounterIcon(),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor: NxHelpers.isDarkMode(context)
                    ? NxColors.black
                    : NxColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(NxSizes.defaultSpace),
                  child: ListView(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    children: [
                      /// -- Search bar
                      const SizedBox(
                        height: NxSizes.spaceBtwItems,
                      ),
                      const NxSearchContainer(
                        text: "Search in Store",
                        showBorder: true,
                        showBackground: false,
                        padding: EdgeInsets.zero,
                      ),
                      const SizedBox(
                        height: NxSizes.spaceBtwSections,
                      ),

                      /// -- Featured Brands
                       NxSectionHeading(
                        title: "Featured Brands",
                        btnOnPressed: () => Get.to(()=> const AllBrandsScreen()),
                      ),
                      const SizedBox(
                        height: NxSizes.spaceBtwItems / 1.5,
                      ),

                      /// Brand GRID
                      Obx(
                          () {

                            if(brandController.isLoading.value) return const NxBrandShimmer();

                            if(brandController.featuredBrands.isEmpty) {
                              return Center(child: Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
                            }
                            return NxGridLayout(
                            itemCount: brandController.featuredBrands.length,
                            mainAxisExtent: 80,
                            itemBuilder: (_, index) {
                              final brand = brandController.featuredBrands[index];
                              return NxBrandCard(
                                brand: brand,
                                showBorder: true,
                                onTap: () => Get.to(() => BrandProductsScreen(brand: brand)),
                              );
                            });
                          },
                      ),
                    ],
                  ),
                ),

                /// Tabs
                bottom:  NxTabBar(
                  tabs: categories.map((category) => Tab(child: Text(category.name))).toList(),
                ),
              ),
            ];
          },
          body: TabBarView(
            /// Content of each tab
            children: categories.map((category) => NxCategoryTab(category: category)).toList(),
          ),
        ),
      ),
    );
  }
}
