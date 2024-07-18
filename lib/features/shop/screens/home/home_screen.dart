import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:nx_commerce/features/shop/screens/home/widgets/home_categories.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';

import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/custom_shapes/containers/search_containers.dart';
import '../../../../common/widgets/text/section_heading.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            NxPrimaryHeaderContainer(
              child: Column(
                children: [
                  /// -- AppBar
                  const NxHomeAppBar(),

                  /// Spacing
                  const SizedBox(
                    height: NxSizes.spaceBtwSections,
                  ),

                  /// -- SearchBar
                  const NxSearchContainer(
                    text: "Search in Store",
                    icon: Iconsax.search_normal,
                  ),

                  /// Spacing
                  const SizedBox(
                    height: NxSizes.spaceBtwSections,
                  ),

                  /// -- Categories
                  Padding(
                    padding: const EdgeInsets.only(left: NxSizes.defaultSpace),
                    child: Column(
                      children: [
                        /// -- Heading
                        NxSectionHeading(
                          title: "Popular Categories",
                          textColor: NxColors.white,
                          showActionButton: false,
                        ),
                        const SizedBox(
                          height: NxSizes.spaceBtwItems,
                        ),

                        /// -- Categories
                        const NxHomeCategories(),
                      ],
                    ),
                  )
                ],
              ),
            ),

            /// -- Body
            Padding(
              padding: const EdgeInsets.all(NxSizes.defaultSpace),
              child: NxRoundedImage(),
            )
          ],
        ),
      ),
    );
  }
}

class NxRoundedImage extends StatelessWidget {
  const NxRoundedImage({
    super.key,
  });
  final double? width, height;
  final String imageUrl;
  final bool applyImageBorderRadius;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(NxSizes.md),
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(NxSizes.md),
          child:  const Image(
            image: AssetImage(NxImages.promoBanners1),
            fit: BoxFit.contain,
          ),),
    );
  }
}
