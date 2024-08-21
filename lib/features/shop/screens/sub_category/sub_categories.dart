import 'package:flutter/material.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/common/widgets/images/rounded_images.dart';
import 'package:nx_commerce/common/widgets/products/product_card/horizontal_product_card.dart';
import 'package:nx_commerce/common/widgets/text/section_heading.dart';
import 'package:nx_commerce/features/shop/controllers/category_controller.dart';
import 'package:nx_commerce/features/shop/models/category_model.dart';
import 'package:nx_commerce/features/shop/screens/all_products/all_products.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/shimmer_effect/horizontal_product_shimmer.dart';

import '../../../../utils/helpers/cloud_helper_functions.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final CategoryController controller = CategoryController.instance;
    return Scaffold(
      appBar: NxAppBar(showBackArrow: true, title: Text(category.name)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(NxSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Banner
              const NxRoundedImage(
                  imageUrl: NxImages.promoBanners2,
                  applyImageBorderRadius: true),
              const SizedBox(height: NxSizes.spaceBtwSections),

              /// -- Sub-Categories
              FutureBuilder(
                  future: controller.getSubCategory(category.id),
                  builder: (context, snapshot) {
                    const loader = NxHorizontalProductShimmer();

                    final widget = NxCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    /// Record Found!
                    final subCategories = snapshot.data!;

                    return ListView.builder(
                        shrinkWrap: true,
                        itemCount: subCategories.length,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          final subCategory = subCategories[index];

                          return FutureBuilder(
                              future: controller.getCategoryProducts(
                                  categoryId: subCategory.id),
                              builder: (context, snapshot) {
                                /// Handle Loader, No Record, or Error Message
                                final widget = NxCloudHelperFunctions
                                    .checkMultiRecordState(
                                        snapshot: snapshot, loader: loader);
                                if (widget != null) return widget;

                                /// Congratulation Record Found.
                                final products = snapshot.data!;

                                return Column(
                                  children: [
                                    NxSectionHeading(
                                      title: subCategory.name,
                                      btnOnPressed: () => AllProductsScreen(
                                        title: subCategory.name,
                                        futureMethod:
                                            controller.getCategoryProducts(
                                                categoryId: subCategory.id,
                                                limit: -1),
                                      ),
                                    ),
                                    const SizedBox(
                                        height: NxSizes.spaceBtwItems / 2),

                                    SizedBox(
                                      height: 120,
                                      child: ListView.separated(
                                          scrollDirection: Axis.horizontal,
                                          shrinkWrap: true,
                                          itemCount: products.length,
                                          separatorBuilder: (_, __) =>
                                              const SizedBox(
                                                  width: NxSizes.spaceBtwItems),
                                          itemBuilder: (_, index) =>
                                              NxProductCardHorizontal(
                                                  product: products[index])),
                                    ),

                                    const SizedBox(
                                        height: NxSizes.spaceBtwSections),

                                  ],
                                );
                              });
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
