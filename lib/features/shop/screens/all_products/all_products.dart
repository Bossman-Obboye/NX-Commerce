import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/features/shop/controllers/products/all_products_controller.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/helpers/cloud_helper_functions.dart';
import 'package:nx_commerce/utils/shimmer_effect/vertical_product_shimmer.dart';

import '../../../../common/widgets/products/sortable/sortable_product.dart';
import '../../models/product_model/product_model.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar:  NxAppBar(title: Text(title), showBackArrow: true),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(NxSizes.defaultSpace),
          child: FutureBuilder(
            future: futureMethod ?? controller.fetchProductsByQuery(query),
            builder: (context, snapshot) {

              ///Check the state of the FutureBuilder snapshot
              const loader = NxVerticalProductShimmer();
             final widget = NxCloudHelperFunctions.checkMultiRecordState(snapshot: snapshot,loader: loader);

             // Return appropriate widget base on snapshot status
              if(widget != null) return widget;

              final List<ProductModel> products = snapshot.data!;
              return NxSortableProducts(products : products);
            }
          ),
        ),
      ),
    );
  }
}
