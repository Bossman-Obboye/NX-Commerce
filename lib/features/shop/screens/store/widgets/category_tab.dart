import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/common/widgets/layout/grid_layout.dart';
import 'package:nx_commerce/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:nx_commerce/common/widgets/text/section_heading.dart';
import 'package:nx_commerce/features/shop/controllers/category_controller.dart';
import 'package:nx_commerce/features/shop/screens/all_products/all_products.dart';
import 'package:nx_commerce/features/shop/screens/store/widgets/category_brands.dart';
import 'package:nx_commerce/utils/shimmer_effect/vertical_product_shimmer.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/cloud_helper_functions.dart';
import '../../../models/category_model.dart';

class NxCategoryTab extends StatelessWidget {
  const NxCategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(NxSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              CategoryBrands(category: category),
              const SizedBox(height: NxSizes.spaceBtwItems),

              /// Products
              FutureBuilder(
                  future:
                      controller.getCategoryProducts(categoryId: category.id),
                  builder: (context, snapshot) {
                    final response =
                        NxCloudHelperFunctions.checkMultiRecordState(
                            snapshot: snapshot,
                            loader: const NxVerticalProductShimmer());
                    if (response != null) return response;

                    /// Record Found!
                    final products = snapshot.data!;

                    return Column(
                      children: [
                        NxSectionHeading(
                          title: "You might like",
                          btnOnPressed: () => Get.to(AllProductsScreen(
                            title: category.name,
                            futureMethod: controller.getCategoryProducts(
                                categoryId: category.id, limit: -1),
                          )),
                        ),
                        const SizedBox(height: NxSizes.spaceBtwItems),
                        NxGridLayout(
                            itemCount: products.length,
                            itemBuilder: (_, index) {
                              return NxProductCardVertical(
                                  product: products[index]);
                            }),
                      ],
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
