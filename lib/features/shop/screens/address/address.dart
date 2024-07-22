import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:nx_commerce/features/shop/screens/address/add_new_address.dart';
import 'package:nx_commerce/features/shop/screens/address/widgets/single_address.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';

import '../../../../utils/constants/colors.dart';

class UserAddressScreen extends StatelessWidget {
  const UserAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => const AddNewAddressScreen()),
        child: const Icon(Iconsax.add, color: NxColors.white),
        backgroundColor: NxColors.primary,
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
          padding: EdgeInsets.all(NxSizes.defaultSpace),
          child: Column(
            children: [
             NxSingleAddress(selectedAddress: true),
             NxSingleAddress(selectedAddress: false),
            ],
          ),
        ),
      ),
    );
  }
}
