import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/common/widgets/loaders/animation_loader.dart';
import 'package:nx_commerce/common/widgets/navigation_bar/navigation_menu.dart';
import 'package:nx_commerce/features/shop/controllers/products/order_controller.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/helpers/cloud_helper_functions.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/helpers/helpers.dart';

class OrderListItems extends StatelessWidget {
  const OrderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OrderController());
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return FutureBuilder(
        future: controller.fetchUserOrders(),
        builder: (_, snapshot) {
          final emptyWidget = NxAnimationLoaderWidget(
            text: 'Whoops! Nor Orders Yet',
            animation: NxImages.darkAppLogo,
            showAction: true,
            actionText: "Let's fill it",
            onActionPressed: () => Get.off(() => const NavigationMenu()),
          );

          final response = NxCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot, nothingFound: emptyWidget);

          if(response != null) return response;

          /// Congratulations Record found
          final orders = snapshot.data!;
          return ListView.separated(
              shrinkWrap: true,
              itemCount: orders.length,
              separatorBuilder: (_, __) => const SizedBox(
                    height: NxSizes.spaceBtwItems,
                  ),
              itemBuilder: (_, index) {
                final order = orders[index];
                return NxRoundedContainer(
                    padding: const EdgeInsets.all(NxSizes.md),
                    showBorder: true,
                    backgroundColor:
                        isDarkMode ? NxColors.dark : NxColors.light,
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
                                    order.orderStatusText,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .apply(
                                            color: NxColors.primary,
                                            fontWeightDelta: 1),
                                  ),
                                  Text(order.formattedOrderDate,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall),
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
                                  const SizedBox(
                                      width: NxSizes.spaceBtwItems / 2),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Order',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                        Text( order.id,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium),
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
                                  const SizedBox(
                                      width: NxSizes.spaceBtwItems / 2),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Shipping Date',
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelMedium,
                                        ),
                                        Text(order.formattedDeliveryDate,
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium),
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
                  );
              });
        });
  }
}
