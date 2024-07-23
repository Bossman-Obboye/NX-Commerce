import 'package:flutter/material.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/common/widgets/images/rounded_images.dart';
import 'package:nx_commerce/common/widgets/products/product_card/horizontal_product_card.dart';
import 'package:nx_commerce/common/widgets/text/section_heading.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NxAppBar(showBackArrow: true, title: Text("Sports shirts")),
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
              Column(
                children: [
                  NxSectionHeading(title: 'Sports shirts', btnOnPressed: () {}),
                  const SizedBox(width: NxSizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 4,
                        separatorBuilder: (_, __) =>
                            const SizedBox(width: NxSizes.spaceBtwItems),
                        itemBuilder: (_, index) =>
                            const NxProductCardHorizontal()),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
