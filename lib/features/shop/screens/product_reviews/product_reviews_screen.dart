import 'package:flutter/material.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/features/shop/screens/product_reviews/widgets/overall_product_rating.dart';
import 'package:nx_commerce/features/shop/screens/product_reviews/widgets/user_review_card.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import '../../../../common/widgets/products/ratings/product_rating_indicator.dart';



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
              const OverallProductRating(),

              /// Rating bar
              const NxRatingBarIndicator(rating: 3.5),
              Text("12,611", style : Theme.of(context).textTheme.bodySmall),
              const SizedBox(height: NxSizes.spaceBtwSections),

               /// Reviews from Users
              const UserReviewCard(),
              const UserReviewCard(),
              const UserReviewCard(),
            ],
          ),
        ),
      ),
    );
  }
}

