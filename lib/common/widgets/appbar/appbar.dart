import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/device/device_utility.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';

import '../../../utils/constants/colors.dart';

/// -- Custom AppBar Pattern
class NxAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NxAppBar(
      {super.key,
      this.title,
      this.showBackArrow = false,
      this.leadingIcon,
      this.actions,
      this.leadingOnPressed});

  /// Fields
  final Widget? title;
  final bool showBackArrow;
  final IconData? leadingIcon;
  final List<Widget>? actions;
  final VoidCallback? leadingOnPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: NxSizes.md),
      child: AppBar(
        /// -- Turn off Flutter_Default_Leading
        automaticallyImplyLeading: false,

        /// -- Leading Widget
        leading: showBackArrow
            ? IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Iconsax.arrow_left, color: NxHelpers.isDarkMode(context) ? NxColors.white : NxColors.dark,))
            : leadingIcon != null
                ? IconButton(
                    onPressed: leadingOnPressed, icon: Icon(leadingIcon))
                : null,

        /// -- Title
        title: title,

        /// -- Actions Icons
        actions: actions,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(NxDeviceUtils.getAppBarHeight());
}
