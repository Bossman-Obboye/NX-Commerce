import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/helpers.dart';

class NxCircularIcon extends StatelessWidget {
  const NxCircularIcon({
    super.key,
    this.height,
    this.iconSize = NxSizes.lg,
    this.width,
    required this.iconData,
    this.onPressed,
    this.backgroundColor,
    this.iconColor,
  });

  final double? height, iconSize, width;
  final IconData iconData;
  final VoidCallback? onPressed;
  final Color? backgroundColor, iconColor;

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor == null
            ? isDarkMode
                ? NxColors.black.withOpacity(0.8)
                : NxColors.white.withOpacity(0.8)
            : backgroundColor!,
        shape: BoxShape.circle,
      ),
      child: IconButton(
          onPressed: onPressed,
          icon: Icon(
            iconData,
            size: iconSize,
            color: iconColor,
          )),
    );
  }
}
