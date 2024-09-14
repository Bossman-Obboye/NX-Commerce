import 'package:flutter/material.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/shimmer_effect/nx_shimmer.dart';

class NxCategoriesShimmer extends StatelessWidget {
  const NxCategoriesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.separated(
          itemCount: 8,
          scrollDirection: Axis.horizontal,
          separatorBuilder: (_, __) =>
              const SizedBox(width: NxSizes.spaceBtwItems),
          itemBuilder: (_, __) => const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Image
                  NxShimmerEffect(width: 55, height: 55, radius: 55),
                  SizedBox(height: NxSizes.spaceBtwItems / 2),

                  /// Text
                  NxShimmerEffect(width: 55, height: 8)
                ],
              )),
    );
  }
}
