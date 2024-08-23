import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/features/personalization/controllers/address_controller.dart';
import 'package:nx_commerce/features/shop/screens/address/add_new_address.dart';
import 'package:nx_commerce/features/shop/screens/address/widgets/single_address.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/helpers/cloud_helper_functions.dart';

import '../../../../utils/constants/colors.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        backgroundColor: NxColors.primary,
        child: const Icon(Iconsax.add, color: NxColors.white),
      ),
      appBar: NxAppBar(
        showBackArrow: true,
        title: Text(
          'Addresses',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(NxSizes.defaultSpace),
          child: Obx(
            () => FutureBuilder(
                // Use key to trigger refresh
                key: Key(controller.refreshData.value.toString()),
                future: controller.getAllUserAddresses(),
                builder: (context, snapshot) {
                  /// Helper Functions: Handle Loader, No Record, or Error Message
                  final response = NxCloudHelperFunctions.checkMultiRecordState(
                      snapshot: snapshot);
                  if (response != null) return response;

                  final addresses = snapshot.data!;
                  return ListView.builder(
                      itemCount: addresses.length,
                      itemBuilder: (_, index) {
                        final currentAddress = addresses[index];
                        return NxSingleAddress(
                            address: currentAddress,
                            onTap: () =>
                                controller.selectAddress(currentAddress));
                      });
                }),
          ),
        ),
      ),
    );
  }
}
