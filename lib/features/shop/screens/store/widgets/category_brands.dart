import 'package:flutter/material.dart';
import 'package:nx_commerce/common/widgets/brand/brand_showcase.dart';
import 'package:nx_commerce/features/shop/controllers/brand_controller.dart';
import 'package:nx_commerce/features/shop/models/category_model.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/helpers/cloud_helper_functions.dart';
import 'package:nx_commerce/utils/shimmer_effect/boxes_shimmer.dart';
import 'package:nx_commerce/utils/shimmer_effect/list_tile_shimmer.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandForCategory(category.id),
        builder: (context, snapshot) {
          /// Handle Loader, No Record, or Error Message
          const loader = Column(
            children: [
              NxListTileShimmer(),
              SizedBox(height: NxSizes.spaceBtwItems),
              NxBoxesShimmer(),
              SizedBox(height: NxSizes.spaceBtwItems),
            ],
          );

          final widget = NxCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, loader: loader);
          if (widget != null) return widget;

          /// Record Found!
          final brands = snapshot.data!;

          return ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
            itemBuilder: (_, index) {
              final brand = brands[index];

              return FutureBuilder(
                  future:
                      controller.getBrandProducts(brandId: brand.id, limit: 3),
                  builder: (context, snapshot) {
                    final widget = NxCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot, loader: loader);
                    if (widget != null) return widget;

                    /// Record Found!
                    final products = snapshot.data!;

                    return NxBrandShowcase(
                        brand: brand,
                        images: products.map((e) => e.thumbnail).toList());
                  });
            },
          );
        });
  }
}
