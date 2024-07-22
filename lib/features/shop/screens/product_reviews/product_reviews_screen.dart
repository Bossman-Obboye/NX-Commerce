import 'package:flutter/material.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/features/shop/screens/product_reviews/widgets/rating_progress_indicator.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';

class ProductReviewsScreen extends StatelessWidget {
  const ProductReviewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// -- Appbar
      appBar: const NxAppBar(
        title: Text("Reviews and Ratings"),
        showBackArrow: true,
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(NxSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                  "Ratings and reviews are verified and are from people who use the same type of device that you use."),
              const SizedBox(height: NxSizes.spaceBtwItems),

              /// -- Overall Product Ratings
              Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: Text("4.8",
                          style: Theme.of(context).textTheme.displayLarge)),
                  const Expanded(
                    flex: 7,
                    child: Column(
                      children: [
                        NxRatingProgressIndicator(text: '5', value: 1.0,),
                        NxRatingProgressIndicator(text: '4', value: 0.8,),
                        NxRatingProgressIndicator(text: '3', value: 0.6,),
                        NxRatingProgressIndicator(text: '2', value: 0.4,),
                        NxRatingProgressIndicator(text: '1', value: 0.2,),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
