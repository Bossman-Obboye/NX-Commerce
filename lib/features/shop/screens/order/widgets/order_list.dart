import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/utils/constants/colors.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helpers.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return ListView.separated( shrinkWrap: true,itemCount: 12, separatorBuilder: (_,__) => const SizedBox(height: NxSizes.spaceBtwItems,)  ,itemBuilder: (_, index) => NxRoundedContainer(
      padding: const EdgeInsets.all(NxSizes.md),
      showBorder: true,
      backgroundColor: isDarkMode ? NxColors.dark : NxColors.light,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          /// -- Row 1
          Row(
            children: [
              /// 1 - Icon
              const Icon(Iconsax.ship),
              const SizedBox(width: NxSizes.spaceBtwItems / 2),

              /// 2 - Status & Date
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Processing',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: NxColors.primary, fontWeightDelta: 1),
                    ),
                    Text('07 Nov, 2024',
                        style: Theme.of(context).textTheme.headlineSmall),
                  ],
                ),
              ),

              /// 3 - Icon
              IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Iconsax.arrow_right_34,
                    size: NxSizes.iconSm,
                  ))
            ],
          ),
          const SizedBox(height: NxSizes.spaceBtwItems / 2),

          /// -- Row 2
          Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    /// 1 - Icon
                    const Icon(Iconsax.tag),
                    const SizedBox(width: NxSizes.spaceBtwItems / 2),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Order',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text('[#256f2]',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  children: [
                    /// 1 - Icon
                    const Icon(Iconsax.calendar),
                    const SizedBox(width: NxSizes.spaceBtwItems / 2),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipping Date',
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          Text('03 Feb 2025',
                              style: Theme.of(context).textTheme.titleMedium),

                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
