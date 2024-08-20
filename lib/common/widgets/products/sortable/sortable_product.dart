

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/features/shop/controllers/products/all_products_controller.dart';
import 'package:nx_commerce/features/shop/models/product_model/product_model.dart';

import '../../../../utils/constants/sizes.dart';
import '../../layout/grid_layout.dart';
import '../product_card/product_card_vertical.dart';

class NxSortableProducts extends StatelessWidget {
  const NxSortableProducts({
    super.key, required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    // Initialize controller for managing product sorting
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        /// Dropdown
        DropdownButtonFormField(
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
            value: controller.selectedSortOption.value,
            onChanged: (value) {
              // Sort product base on the selected option
              controller.sortProducts(value!);
            },
            items:
            ['Name', 'Higher Price', 'Lower Price', 'Sale', 'Newest', 'Popularity'].map((item) => DropdownMenuItem(value: item ,child: Text(item))).toList()
        ),
        const SizedBox(height: NxSizes.spaceBtwSections),
        /// Products
        Obx(()=> NxGridLayout(itemCount: controller.products.length, itemBuilder: (_, index) => NxProductCardVertical(product: controller.products[index])))
      ],
    );
  }
}
