import 'package:flutter/material.dart';
import 'package:nx_commerce/common/widgets/brand/brand_card.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/sortable/sortable_product.dart';
import '../../../../utils/constants/sizes.dart';

class BrandProductsScreen extends StatelessWidget {
  const BrandProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: NxAppBar(title: Text('Nike'), showBackArrow: true),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.all(NxSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Brand Details
                  NxBrandCard(showBorder: true),
                  SizedBox(height: NxSizes.spaceBtwSections),


                  /// Products
                  NxSortableProducts(),
                ],
              ))),
    );
  }
}
