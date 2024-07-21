import 'package:flutter/material.dart';
import '../../../utils/constants/sizes.dart';

class NxCircularImage extends StatelessWidget {
  const NxCircularImage({
    super.key,
    this.fit = BoxFit.cover,
    required this.image,
    this.isNetworkImage = false,
    this.backgroundColor,
    this.width = 56,
    this.height = 56,
    this.padding = NxSizes.sm,
    this.overlayColor,
  });

  final BoxFit? fit;
  final String image;
  final bool isNetworkImage;
  final Color? backgroundColor, overlayColor;
  final double width, height, padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Image(
          fit: fit,
          image: isNetworkImage ? NetworkImage(image) :  AssetImage(image) as ImageProvider,
          color: overlayColor,
        ),
      ),
    );
  }
}
