import 'package:flutter/material.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';

import '../../../../common/widgets/products/sortable/sortable_product.dart';

class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar:  NxAppBar(title: Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(NxSizes.defaultSpace),
          child: NxSortableProducts(),
        ),
      ),
    );
  }
}
