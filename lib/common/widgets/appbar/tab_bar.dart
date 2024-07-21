import 'package:flutter/material.dart';
import 'package:nx_commerce/utils/device/device_utility.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';

import '../../../utils/constants/colors.dart';

class NxTabBar extends StatelessWidget implements PreferredSizeWidget {
  const NxTabBar({super.key, required this.tabs});

  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final isDarkMode = NxHelpers.isDarkMode(context);
    return Material(
      color: isDarkMode ? NxColors.black : NxColors.white,
      child: TabBar(
        isScrollable: true,
        indicatorColor: NxColors.primary,
        unselectedLabelColor: NxColors.darkGrey,
        labelColor:
            NxHelpers.isDarkMode(context) ? NxColors.white : NxColors.primary,
        tabs:tabs,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(NxDeviceUtils.getAppBarHeight());
}
