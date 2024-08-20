import 'package:flutter/material.dart';
import 'package:nx_commerce/common/widgets/brand/brand_card.dart';
import 'package:nx_commerce/features/shop/controllers/brand_controller.dart';
import 'package:nx_commerce/utils/helpers/cloud_helper_functions.dart';
import 'package:nx_commerce/utils/shimmer_effect/vertical_product_shimmer.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/sortable/sortable_product.dart';
import '../../../../utils/constants/sizes.dart';
import '../../models/brand_model/brand_model.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key, required this.brand});

  final BrandModel brand;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: NxAppBar(title: Text(brand.name), showBackArrow: true),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(NxSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Brand Details
                  NxBrandCard(showBorder: true, brand: brand),
                  const SizedBox(height: NxSizes.spaceBtwSections),


                  /// Products
                 FutureBuilder(
                    future: controller.getBrandProducts(brand.id),
                    builder: (context, snapshot) {
                      /// Handle Loader, No Record or Error Message
                      const loader = NxVerticalProductShimmer();
                      final widget = NxCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot, loader: loader);

                      if(widget != null) return widget;

                      /// Record Found!
                      final brandProducts = snapshot.data!;

                      return NxSortableProducts(products: brandProducts);
                    }
                  ),
                ],
              ))),
    );
  }
}
