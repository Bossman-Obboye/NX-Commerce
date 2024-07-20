import 'package:flutter/material.dart';

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
              title: "Logos Category",
              onTap: (){},
            );
          }),
    );
  }
}
