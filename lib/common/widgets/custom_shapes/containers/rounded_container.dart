import 'package:flutter/material.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import '../../../../utils/constants/colors.dart';

class NxRoundedContainer extends StatelessWidget {
  const NxRoundedContainer({
    super.key,
    this.height,
    this.width,
    this.radius = NxSizes.cardRadiusLg,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.child,
    this.showBorder = false,
    this.borderColor = NxColors.borderPrimary,
  });

  /// -- Fields
  final double? height, width;
  final double radius;
  final Color borderColor;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? margin, padding;
  final Widget? child;
  final bool showBorder;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      width: width,
      height: height,
      padding: padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        border: showBorder ? Border.all(color: borderColor) : null,
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
