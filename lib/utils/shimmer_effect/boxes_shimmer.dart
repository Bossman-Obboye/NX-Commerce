import 'package:flutter/material.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/shimmer_effect/nx_shimmer.dart';

class NxBoxesShimmer extends StatelessWidget {
  const NxBoxesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Expanded(child: NxShimmerEffect(width: 150, height: 110)),
            SizedBox(width: NxSizes.spaceBtwItems),
            Expanded(child: NxShimmerEffect(width: 150, height: 110)),
            SizedBox(width: NxSizes.spaceBtwItems),
            Expanded(child: NxShimmerEffect(width: 150, height: 110)),

          ],
        )
      ],
    );
  }
}
