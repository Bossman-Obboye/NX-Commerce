import 'package:flutter/material.dart';
import 'package:nx_commerce/common/widgets/layout/grid_layout.dart';
import 'package:nx_commerce/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:nx_commerce/common/widgets/text/section_heading.dart';
import 'package:nx_commerce/features/shop/models/product_model/product_model.dart';

import '../../../../../common/widgets/brand/brand_showcase.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../models/category_model.dart';

class NxCategoryTab extends StatelessWidget {
  const NxCategoryTab({super.key, required this.category});

  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        Padding(
          padding: const EdgeInsets.all(NxSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Brands
              const NxBrandShowcase(
                images: [
                  NxImages.productImage3,
                  NxImages.productImage2,
                  NxImages.productImage7
                ],
              ),

              /// Products
              NxSectionHeading(
                title: "You might like",
                showActionButton: true,
                btnOnPressed: () {},
              ),
              const SizedBox(
                height: NxSizes.spaceBtwItems,
              ),

              NxGridLayout(
                  itemCount: 4,
                  itemBuilder: (_, index) {
                    return NxProductCardVertical(product: ProductModel.empty());
                  }),
              const SizedBox(
                height: NxSizes.spaceBtwSections,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
