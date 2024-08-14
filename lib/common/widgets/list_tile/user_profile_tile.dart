import "package:flutter/material.dart";
import "package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart";
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
      onTap: null,
      leading:  /// -- Profile Picture
      Obx(
            () {
          final networkImage = controller.user.value.profilePicture;
          final image = networkImage.isNotEmpty ? networkImage : NxImages.user;
          return NxCircularImage(
            isNetworkImage: networkImage.isNotEmpty,
            image: image,
            width: 50,
            height: 50,
            padding: 0,
          );
        },
      ),
      title: Text(controller.user.value.fullName, style: Theme.of(context).textTheme.headlineSmall!.apply(color: NxColors.white)),
      subtitle: Text(controller.user.value.email, style: Theme.of(context).textTheme.bodyMedium!.apply(color: NxColors.white)),
      trailing:  IconButton( onPressed: onTap,icon: const Icon(Iconsax.edit, color: NxColors.white,),),
    );
  }
}
