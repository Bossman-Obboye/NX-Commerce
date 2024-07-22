import 'package:flutter/material.dart';
import 'package:nx_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:nx_commerce/common/widgets/products/ratings/product_rating_indicator.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:readmore/readmore.dart';

import '../../../../../utils/helpers/helpers.dart';

class UserReviewCard extends StatelessWidget {
  const UserReviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return Column(
      children: [
        Row(
          children: [
            const CircleAvatar(
                backgroundImage: AssetImage(NxImages.userProfileImage1)),
            const SizedBox(width: NxSizes.spaceBtwItems),
            Text("John Doe", style: Theme.of(context).textTheme.titleLarge),
            const Spacer(),
            IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
          ],
        ),
        const SizedBox(height: NxSizes.spaceBtwItems),
        Row(
          children: [
            const NxRatingBarIndicator(rating: 4),
            const SizedBox(width: NxSizes.spaceBtwItems),
            Text("02 Nov, 2023", style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: NxSizes.spaceBtwItems),
        const ReadMoreText(
          'The user interface of this app is quite intuitive. I was able to navigate and make purchases seamlessly. Great Job!',
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimExpandedText: " show less",
          trimCollapsedText: " show more",
          moreStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: NxColors.primary),
          lessStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: NxColors.primary),
        ),
        const SizedBox(height: NxSizes.spaceBtwItems),

        /// Company Review
        NxRoundedContainer(
          padding: const EdgeInsets.all(NxSizes.md),
          backgroundColor: isDarkMode ? NxColors.darkerGrey : NxColors.grey,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Nx Commerce",
                      style: Theme.of(context).textTheme.titleMedium),
                  Text("02 Nov, 2023",
                      style: Theme.of(context).textTheme.bodyMedium),
                ],
              ),
              const SizedBox(height: NxSizes.spaceBtwItems),
              const ReadMoreText(
                'The user interface of this app is quite intuitive. I was able to navigate and make purchases seamlessly. Great Job!',
                trimLines: 2,
                trimMode: TrimMode.Line,
                trimExpandedText: " show less",
                trimCollapsedText: " show more",
                moreStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: NxColors.primary),
                lessStyle: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: NxColors.primary),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: NxSizes.spaceBtwSections,
        ),
      ],
    );
  }
}
