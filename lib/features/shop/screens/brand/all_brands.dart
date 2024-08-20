import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/common/widgets/brand/brand_card.dart';
import 'package:nx_commerce/common/widgets/layout/grid_layout.dart';
import 'package:nx_commerce/common/widgets/text/section_heading.dart';
import 'package:nx_commerce/features/shop/controllers/brand_controller.dart';
import 'package:nx_commerce/features/shop/screens/brand/brand_products.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';

import '../../../../utils/shimmer_effect/brand_shimmer.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final brandController = BrandController.instance;
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
              Obx(
                    () {

                  if(brandController.isLoading.value) return const NxBrandShimmer();

                  if(brandController.allBrands.isEmpty) {
                    return Center(child: Text('No Data Found', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white)));
                  }
                  return NxGridLayout(
                      itemCount: brandController.allBrands.length,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        final brand = brandController.allBrands[index];
                        return NxBrandCard(
                          onTap: ()=> Get.to(()=> BrandProductsScreen(brand: brand)),
                          brand: brand,
                          showBorder: true,
                        );
                      });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
