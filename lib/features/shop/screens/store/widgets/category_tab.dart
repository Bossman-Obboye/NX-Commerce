import 'package:flutter/material.dart';
import 'package:nx_commerce/common/widgets/layout/grid_layout.dart';
import 'package:nx_commerce/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:nx_commerce/common/widgets/text/section_heading.dart';

import '../../../../../common/widgets/brand/brand_showcase.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/constants/sizes.dart';

class NxCateroryTab extends StatelessWidget {
  const NxCateroryTab({super.key});

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
                    return const NxProductCardVertical();
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
