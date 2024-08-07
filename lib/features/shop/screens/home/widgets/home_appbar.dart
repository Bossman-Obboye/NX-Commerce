import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbar/appbar.dart';
import '../../../../../common/widgets/products/cart/cart_menu_icon.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/text_strings.dart';

class NxHomeAppBar extends StatelessWidget {
  const NxHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    /// -- Custom AppBar
    return NxAppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// -- Title and SubTitle
          Text(NxTexts.homeAppbarTitle,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .apply(color: NxColors.grey)),
          Text(NxTexts.homeAppbarSubTitle,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .apply(color: NxColors.white)),
        ],
      ),
      actions: const [
        /// -- Icons
        NxCartCounterIcon(
          iconColor: NxColors.white,
          counterBgColor: NxColors.black,
          counterTextColor: NxColors.white,
        ),
      ],
    );
  }
}
