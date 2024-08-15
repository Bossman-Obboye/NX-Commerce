import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nx_commerce/utils/shimmer_effect/nx_shimmer.dart';
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
      child: ClipRRect(
        borderRadius: BorderRadius.circular(56),
        child: Center(
          child: isNetworkImage ? CachedNetworkImage(fit: fit, color: overlayColor,imageUrl: image,
          progressIndicatorBuilder: (context, url, downloadProgress) => const NxShimmerEffect(width: 55, height: 55, radius: 55,),
          errorWidget: (context, url, error) => const Icon(Icons.error),):
          
          Image(
            fit: fit,
            image: AssetImage(image),
            color: overlayColor,
          ),
        ),
      ),
    );
  }
}
