import "package:flutter/material.dart";
import "package:iconsax/iconsax.dart";

import "../../../utils/constants/colors.dart";
import "../../../utils/constants/image_strings.dart";
import "../images/circular_image.dart";


class NxUserProfileTile extends StatelessWidget {
  const NxUserProfileTile({
    super.key,
  });

   // final String title, subTitle;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const NxCircularImage(
        image: NxImages.user,
        height: 50,
        width: 50,
        padding: 0,
      ),
      title: Text("NX Generation", style: Theme.of(context).textTheme.headlineSmall!.apply(color: NxColors.white)),
      subtitle: Text("nxted024@gmail.com", style: Theme.of(context).textTheme.bodyMedium!.apply(color: NxColors.white)),
      trailing:  IconButton( onPressed: (){},icon: const Icon(Iconsax.edit, color: NxColors.white,),),
    );
  }
}
