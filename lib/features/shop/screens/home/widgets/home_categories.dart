import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/features/shop/screens/sub_category/sub_categories.dart';

import '../../../../../common/widgets/images/image_text_widget.dart';
import '../../../../../utils/constants/image_strings.dart';


class NxHomeCategories extends StatelessWidget {
  const NxHomeCategories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            return  NxVerticalImageText(
              image: NxImages.darkAppLogo,
              title: "Backpack",
              onTap: () => Get.to(()=> const SubCategoriesScreen()),
            );
          }),
    );
  }
}
