import 'package:flutter/material.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';
import 'package:shimmer/shimmer.dart';

class NxShimmerEffect extends StatelessWidget {
  const NxShimmerEffect({super.key, required this.width, required this.height, this.radius = 15.00, this.color});

  final double width, height, radius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return Shimmer.fromColors(
      baseColor: isDarkMode ? Colors.grey[850]! : Colors.grey[300]!,
      highlightColor: isDarkMode ? Colors.grey[700]! : Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color ?? (isDarkMode ? NxColors.darkerGrey : NxColors.white),
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
