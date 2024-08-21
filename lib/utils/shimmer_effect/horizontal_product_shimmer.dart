import 'package:flutter/material.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/shimmer_effect/nx_shimmer.dart';

class NxHorizontalProductShimmer extends StatelessWidget {
  const NxHorizontalProductShimmer({this.itemCount = 4, super.key});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: NxSizes.spaceBtwSections),
      height: 120,
      child: ListView.separated(
          itemCount: itemCount,
          separatorBuilder: (_, __) =>
              const SizedBox(width: NxSizes.spaceBtwItems),
          itemBuilder: (_, __) => const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              /// Image
              NxShimmerEffect(width: 120, height: 120),
              SizedBox(width: NxSizes.spaceBtwItems),

              /// Text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: NxSizes.spaceBtwItems / 2),
                  NxShimmerEffect(width: 160, height: 15),
                  SizedBox(height: NxSizes.spaceBtwItems / 2),
                  NxShimmerEffect(width: 110, height: 15),
                  SizedBox(height: NxSizes.spaceBtwItems / 2),
                  NxShimmerEffect(width: 85, height: 15),
                ],
              ),
            ],
          )),
    );
  }
}
