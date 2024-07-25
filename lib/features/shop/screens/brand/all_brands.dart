import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/common/widgets/brand/brand_card.dart';
import 'package:nx_commerce/common/widgets/layout/grid_layout.dart';
import 'package:nx_commerce/common/widgets/text/section_heading.dart';
import 'package:nx_commerce/features/shop/screens/brand/brand_products.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NxAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(NxSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Heading
              const NxSectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              const SizedBox(height: NxSizes.spaceBtwItems),

              /// -- Brands
              NxGridLayout(
                itemCount: 10,
                mainAxisExtent: 80,
                itemBuilder: (_, index) => NxBrandCard(
                  showBorder: true,
                  onTap: () => Get.to(
                    () => const BrandProductsScreen(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
