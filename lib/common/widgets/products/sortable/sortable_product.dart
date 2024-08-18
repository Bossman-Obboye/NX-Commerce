

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/features/shop/models/product_model/product_model.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layout/grid_layout.dart';
import '../product_card/product_card_vertical.dart';

class NxSortableProducts extends StatelessWidget {
  const NxSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            onChanged: (value) {},
            items:
            ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity'].map((item) => DropdownMenuItem(value: item ,child: Text(item))).toList()
        ),
        const SizedBox(height: NxSizes.spaceBtwSections),
        /// Products
        NxGridLayout(itemCount: 8, itemBuilder: (_, index) => NxProductCardVertical(product: ProductModel.empty()))
      ],
    );
  }
}
