import "package:flutter/material.dart";
import "package:iconsax/iconsax.dart";
import "package:nx_commerce/features/personalization/controllers/user_controller.dart";

import "../../../utils/constants/colors.dart";
import "../../../utils/constants/image_strings.dart";
import "../images/circular_image.dart";


class NxUserProfileTile extends StatelessWidget {
  const NxUserProfileTile({
    super.key, this.onTap,
  });

  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return ListTile(
      onTap: onTap,
      leading: const NxCircularImage(
        image: NxImages.user,
        height: 50,
        width: 50,
        padding: 0,
      ),
      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: NxColors.white)),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: NxColors.white)),
      trailing:  IconButton( onPressed: (){},icon: const Icon(Iconsax.edit, color: NxColors.white,),),
    );
  }
}
