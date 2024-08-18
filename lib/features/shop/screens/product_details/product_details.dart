import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:iconsax/iconsax.dart";
import "package:nx_commerce/common/widgets/text/section_heading.dart";
import "package:nx_commerce/features/shop/models/product_model/product_model.dart";
import "package:nx_commerce/features/shop/screens/product_details/widgets/bottom_add_to_cart.dart";
import "package:nx_commerce/features/shop/screens/product_details/widgets/product_attributes.dart";
import "package:nx_commerce/features/shop/screens/product_details/widgets/product_image_slider.dart";
import "package:nx_commerce/features/shop/screens/product_details/widgets/product_meta_data.dart";
import "package:nx_commerce/features/shop/screens/product_details/widgets/rating_share_widget.dart";
import "package:nx_commerce/features/shop/screens/product_reviews/product_reviews_screen.dart";
import "package:nx_commerce/utils/constants/sizes.dart";
import "package:readmore/readmore.dart";

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return   Scaffold(
      bottomNavigationBar: const NxBottomAddToCart(),
        body: SingleChildScrollView(
            child: Column(
      children: [
        /// -- Product Image Slider
        NxProductImageSlider(product: product),

        /// -- Product Details
        Padding(
          padding: const EdgeInsets.only(right: NxSizes.defaultSpace, left: NxSizes.defaultSpace, bottom: NxSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Rating & Share
              const NxRatingAndShareBar(),

              /// -- Price, Title, Stock, & Brand
              NxProductMetaData(product: product ,),
              
              /// -- Attributes
              const NxProductAttributes(),
              const SizedBox(
                height: NxSizes.spaceBtwSections
              ),

              /// -- Checkout Button
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: const Text('Checkout'))),
              const SizedBox(
                  height: NxSizes.spaceBtwSections
              ),

              /// -- Description
             const NxSectionHeading(title: 'Description', showActionButton: false,),
              const SizedBox(
                height: NxSizes.spaceBtwItems
              ),
              const ReadMoreText('This is a Product description for a Grey Nike MultiPurpose Backpack. Use for keeping laptops, for school, and more. There are more things that can be added but I am just practicing and nothing else.',
              trimLines: 2,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' show more',
                trimExpandedText: ' show less',
                moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
              ),

              /// -- Reviews
              const Divider(),
              const SizedBox(
                  height: NxSizes.spaceBtwSections
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const NxSectionHeading(title: 'Reviews(199)', showActionButton: false,),
                  IconButton(onPressed: () =>Get.to(()=> const ProductReviewsScreen()), icon: const Icon(Iconsax.arrow_right_3))
                ],
              ),
              const SizedBox(height: NxSizes.spaceBtwSections,),
            ],
          ),
        )
      ],
    )));
  }
}

