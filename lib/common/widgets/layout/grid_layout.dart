import 'package:flutter/material.dart';

import '../../../utils/constants/sizes.dart';

class NxGridLayout extends StatelessWidget {
  const NxGridLayout({
    super.key,
    this.mainAxisExtent = 280,
    required this.itemCount,
    required this.itemBuilder,
  });

  final double? mainAxisExtent;
  final int itemCount;
  final Widget? Function(BuildContext context, int index) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisExtent: mainAxisExtent,
          crossAxisCount: 2,
          mainAxisSpacing: NxSizes.gridViewSpacing,
          crossAxisSpacing: NxSizes.gridViewSpacing,
        ),
        itemCount: itemCount,
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: itemBuilder);
  }
}
