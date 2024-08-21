import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/features/personalization/controllers/address_controller.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/validators/validators.dart';

class AddNewAddressScreen extends StatelessWidget {
  const AddNewAddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = AddressController.instance;
    return Scaffold(
      appBar:
          const NxAppBar(title: Text('Add new Address'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(NxSizes.defaultSpace),
          child: Form(
            key: controller.addressFormKey,
            child: Column(
              children: [
                TextFormField(
                    validator: (value) =>
                        NxValidators.validateEmptyText('Name', value),
                    controller: controller.name,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.user), labelText: "Name")),
                const SizedBox(height: NxSizes.spaceBtwInputFields),
                TextFormField(
                    validator: NxValidators.validatePhoneNumber,
                    controller: controller.phoneNumber,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.mobile),
                        labelText: "Phone Number")),
                const SizedBox(height: NxSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                            validator: (value) =>
                                NxValidators.validateEmptyText(
                                   "Street" , value),
                            controller: controller.street,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.building_31),
                                labelText: "Street"))),
                    const SizedBox(width: NxSizes.spaceBtwInputFields),
                    Expanded(
                        child: TextFormField(
                            validator: (value) =>
                                NxValidators.validateEmptyText(
                                   "Postal Code" , value),
                            controller: controller.postalCode,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.code),
                                labelText: "Postal Code"))),
                  ],
                ),
                const SizedBox(height: NxSizes.spaceBtwInputFields),
                Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                            validator: (value) =>
                                NxValidators.validateEmptyText(
                                    "City", value),
                            controller: controller.city,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.building),
                                labelText: "City"))),
                    const SizedBox(width: NxSizes.spaceBtwInputFields),
                    Expanded(
                        child: TextFormField(
                            validator: (value) =>
                                NxValidators.validateEmptyText(
                                    "State", value),
                            controller: controller.state,
                            decoration: const InputDecoration(
                                prefixIcon: Icon(Iconsax.activity),
                                labelText: "State"))),
                  ],
                ),
                const SizedBox(height: NxSizes.spaceBtwInputFields),
                TextFormField(
                    validator: (value) =>
                        NxValidators.validateEmptyText("Country", value),
                    controller: controller.country,
                    decoration: const InputDecoration(
                        prefixIcon: Icon(Iconsax.global),
                        labelText: "Country")),
                const SizedBox(height: NxSizes.spaceBtwInputFields),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text('Save')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
