import 'package:flutter/material.dart';
import 'package:nx_commerce/common/widgets/layout/grid_layout.dart';
import 'package:nx_commerce/utils/shimmer_effect/nx_shimmer.dart';

class NxBrandShimmer extends StatelessWidget {
  const NxBrandShimmer({super.key, this.itemCount = 4});

  final int itemCount;
  @override
  Widget build(BuildContext context) {
    return NxGridLayout(
      mainAxisExtent: 80,
      itemCount: itemCount,
           /// Image
      itemBuilder: (_, __) => const NxShimmerEffect(width: 300, height: 80),

    );
  }
}
