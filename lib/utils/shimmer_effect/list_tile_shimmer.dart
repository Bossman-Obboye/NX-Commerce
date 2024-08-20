import 'package:flutter/material.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/shimmer_effect/nx_shimmer.dart';

class NxListTileShimmer extends StatelessWidget {
  const NxListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
         Row(
          children: [
            NxShimmerEffect(width: 50, height: 50, radius: 50),
            SizedBox(width: NxSizes.spaceBtwItems),
            Column(
              children: [
                NxShimmerEffect(width: 100, height: 15),
                SizedBox(width: NxSizes.spaceBtwItems),
                NxShimmerEffect(width: 80, height: 12),
              ],
            )
          ],
        ),
      ],
    );
  }
}
