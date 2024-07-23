
import 'package:flutter/material.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';

import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../custom_shapes/containers/rounded_container.dart';

class NxCouponCode extends StatelessWidget {
  const NxCouponCode({
    super.key,
  });



  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return NxRoundedContainer(
      showBorder: true,
      backgroundColor: isDarkMode ? NxColors.dark : NxColors.white,
      padding: const EdgeInsets.only(
          right: NxSizes.sm,
          bottom: NxSizes.sm,
          top: NxSizes.sm,
          left: NxSizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have a promo code? Enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ),
            ),
          ),

          /// -- Button
          SizedBox(
            width: 75,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  foregroundColor: isDarkMode ? NxColors.white.withOpacity(0.5) : NxColors.dark.withOpacity(0.5),
                  backgroundColor: Colors.grey.withOpacity(0.2),
                  side: BorderSide(color: Colors.grey.withOpacity(0.1))
              ),
              child: const Text('Apply'),
            ),
          )
        ],
      ),
    );
  }
}
