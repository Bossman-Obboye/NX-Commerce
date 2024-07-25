import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/common/widgets/appbar/tab_bar.dart';
import 'package:nx_commerce/common/widgets/brand/brand_card.dart';
import 'package:nx_commerce/common/widgets/custom_shapes/containers/search_containers.dart';
import 'package:nx_commerce/common/widgets/layout/grid_layout.dart';
import 'package:nx_commerce/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:nx_commerce/common/widgets/text/section_heading.dart';
import 'package:nx_commerce/features/shop/screens/brand/all_brands.dart';
import 'package:nx_commerce/features/shop/screens/store/widgets/category_tab.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';

import '../../../../utils/constants/sizes.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final bool isDarkMode = NxHelpers.isDarkMode(context);
    return DefaultTabController(
      length: 5,
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
                      NxGridLayout(
                          itemCount: 4,
                          mainAxisExtent: 80,
                          itemBuilder: (_, index) {
                            return const NxBrandCard(
                              showBorder: true,
                            );
                          }),
                    ],
                  ),
                ),

                /// Tabs
                bottom: const NxTabBar(
                  tabs: [
                    Tab(child: Text("Sports")),
                    Tab(child: Text("Furniture")),
                    Tab(child: Text("Electronics")),
                    Tab(child: Text("Clothes")),
                    Tab(child: Text("Cosmetics")),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            /// Content of each tab
            children: [
              NxCateroryTab(),
              NxCateroryTab(),
              NxCateroryTab(),
              NxCateroryTab(),
              NxCateroryTab(),
            ],
          ),
        ),
      ),
    );
  }
}
