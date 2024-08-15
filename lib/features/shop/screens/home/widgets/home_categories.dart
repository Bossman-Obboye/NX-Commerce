import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/features/shop/controllers/category_controller.dart';
import 'package:nx_commerce/features/shop/screens/sub_category/sub_categories.dart';

import '../../../../../common/widgets/images/image_text_widget.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../../../../../utils/shimmer_effect/categories_shimmer.dart';


class NxHomeCategories extends StatelessWidget {
  const NxHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Obx(
      () {
        if(categoryController.isLoading.value) return const NxCategoriesShimmer();

        if(categoryController.featuredCategories.isEmpty) {
          return
            Center(child: Text('No Data Found!', style: Theme.of(context).textTheme.bodyMedium!.apply(color: Colors.white),),);
        }

        return SizedBox(
        height: 80,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: categoryController.featuredCategories.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (_, index) {
              final category = categoryController.featuredCategories[index];
              return  NxVerticalImageText(
                
                image: category.image,
                title: category.name,
                onTap: () => Get.to(()=> const SubCategoriesScreen()),
              );
            }),
      );
      },
    );
  }
}
