import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/features/personalization/controllers/address_controller.dart';
import 'package:nx_commerce/features/personalization/models/address_model.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';

class NxSingleAddress extends StatelessWidget {
  const NxSingleAddress(
      {super.key, required this.address, required this.onTap});

  final AddressModel address;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;

    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return Obx(
      () {
        final selectedAddressId = controller.selectedAddress.value.id;
        final selectedAddress = selectedAddressId == address.id;

        return InkWell(
          onTap: onTap,
          child: NxRoundedContainer(
            padding: const EdgeInsets.all(NxSizes.md),
            width: double.infinity,
            showBorder: true,
            backgroundColor: selectedAddress
                ? NxColors.primary.withOpacity(0.5)
                : Colors.transparent,
            borderColor: selectedAddress
                ? Colors.transparent
                : isDarkMode
                    ? NxColors.darkerGrey
                    : NxColors.grey,
            margin: const EdgeInsets.only(bottom: NxSizes.spaceBtwItems),
            child: Stack(
              children: [
                if (selectedAddress)
                  Positioned(
                    right: 5,
                    top: 0,
                    child: Icon(Iconsax.tick_circle5,
                        color: isDarkMode ? NxColors.light : NxColors.dark),
                  ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      address.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    const SizedBox(height: NxSizes.sm / 2),
                    Text(address.formattedPhoneNo,
                        maxLines: 1, overflow: TextOverflow.ellipsis),
                    const SizedBox(height: NxSizes.sm / 2),
                    Text(address.toString(), softWrap: true),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
