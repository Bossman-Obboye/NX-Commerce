import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/common/widgets/layout/grid_layout.dart';
import 'package:nx_commerce/common/widgets/products/product_card/product_card_vertical.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NxAppBar(title: Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(NxSizes.defaultSpace),
          child: Column(
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
              NxGridLayout(itemCount: 8, itemBuilder: (_, index) => const NxProductCardVertical())
            ],
          ),
        ),
      ),
    );
  }
}
