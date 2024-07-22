import "package:flutter/material.dart";
import "package:nx_commerce/features/shop/screens/product_details/widgets/product_image_slider.dart";
import "package:nx_commerce/features/shop/screens/product_details/widgets/product_meta_data.dart";
import "package:nx_commerce/features/shop/screens/product_details/widgets/rating_share_widget.dart";
import "package:nx_commerce/utils/constants/sizes.dart";
import "../../../../utils/helpers/helpers.dart";

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return  const Scaffold(
        body: SingleChildScrollView(
            child: Column(
      children: [
        /// -- Product Image Slider
        NxProductImageSlider(),

        /// -- Product Details
        Padding(
          padding: EdgeInsets.only(right: NxSizes.defaultSpace, left: NxSizes.defaultSpace, bottom: NxSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Rating & Share
              NxRatingAndShareBar(),

              /// -- Price, Title, Stock, & Brand
              ProductMetaData(),
              /// -- Attributes

              /// -- Checkout Button

              /// -- Description

              /// -- Reviews
            ],
          ),
        )
      ],
    )));
  }
}

