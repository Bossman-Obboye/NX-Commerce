import 'package:flutter/cupertino.dart';
import 'package:nx_commerce/common/widgets/layout/grid_layout.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/shimmer_effect/nx_shimmer.dart';

class NxVerticalProductShimmer extends StatelessWidget {
  const NxVerticalProductShimmer({this.itemCount = 4, super.key});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return NxGridLayout(
      itemCount: itemCount,
      itemBuilder: (_, __) => const SizedBox(
        width: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            NxShimmerEffect(width: 180, height: 180),
            SizedBox(height: NxSizes.spaceBtwItems),

            /// Text
            NxShimmerEffect(width: 160, height: 15),
            SizedBox(height: NxSizes.spaceBtwItems / 2),
            NxShimmerEffect(width: 110, height: 15),
          ],
        ),
      ),
    );
  }
}
