import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/data/repositories/address_repo/address_repository.dart';
import 'package:nx_commerce/features/shop/screens/address/add_new_address.dart';
import 'package:nx_commerce/features/shop/screens/address/widgets/single_address.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/helpers/cloud_helper_functions.dart';
import 'package:nx_commerce/utils/loaders/loaders.dart';
import 'package:nx_commerce/utils/popups/full_screen_loader.dart';

import '../../../common/widgets/text/section_heading.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/helpers/network_manager.dart';
import '../../../utils/loaders/circular_loader.dart';
import '../models/address_model.dart';

class AddressController extends GetxController {
  static AddressController get instance => Get.find();

  /// Variables
  RxBool refreshData = true.obs;
  final addressRepository = Get.put(AddressRepository());
  final Rx<AddressModel> selectedAddress = AddressModel.empty().obs;
  final name = TextEditingController();
  final phoneNumber = TextEditingController();
  final street = TextEditingController();
  final city = TextEditingController();
  final state = TextEditingController();
  final postalCode = TextEditingController();
  final country = TextEditingController();
  GlobalKey<FormState> addressFormKey = GlobalKey<FormState>();

  /// Fetch all user specific addresses
  Future<List<AddressModel>> getAllUserAddresses() async {
    try {
      final addresses = await addressRepository.fetchUserAddresses();

      selectedAddress.value = addresses.firstWhere(
          (element) => element.selectedAddress,
          orElse: () => AddressModel.empty());

      return addresses;
    } catch (e) {
      NxLoaders.errorSnackBar(
          title: 'Address not found', message: e.toString());
      return [];
    }
  }

  Future selectAddress(AddressModel newSelectedAddress) async {
    try {
      Get.defaultDialog(
        title: '',
        onWillPop: () async {
          return false;
        },
        barrierDismissible: false,
        backgroundColor: Colors.transparent,
        content: const NxCircularLoader(),
      );

      // Clear the 'selected' field.
      if (selectedAddress.value.id.isNotEmpty) {
        await addressRepository.updateSelectedField(
            selectedAddress.value.id, false);
      }

      // Assign selected address
      newSelectedAddress.selectedAddress = true;

      // Set the 'selected' field to true for the newly selected address
      await addressRepository.updateSelectedField(
          selectedAddress.value.id, true);
    } catch (e) {
      NxLoaders.errorSnackBar(
          title: 'Error in Selection', message: e.toString());
    }
  }

  Future addNewAddresses(AddressModel newSelectedAddress) async {
    try {
      // Start Loading
      NxFullScreenLoader.openLoadingDialog('We are processing your information',
          NxImages.staticSuccessIllustration);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        // Remove Loader
        NxFullScreenLoader.stopLoading();
        return;
      }

      // Check Form Validation
      if (!addressFormKey.currentState!.validate()) {
        NxFullScreenLoader.stopLoading();
        return;
      }

      // Save Address Data
      final address = AddressModel(
        id: '',
        name: name.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        street: street.text.trim(),
        city: city.text.trim(),
        state: state.text.trim(),
        postalCode: postalCode.text.trim(),
        country: country.text.trim(),
        selectedAddress: true,
      );

      final id = await addressRepository.addAddress(address);

      // Update Selected Address status
      address.id = id;
      await selectAddress(address);

      // Remove Loader
      NxFullScreenLoader.stopLoading();

      // Show Success Message
      NxLoaders.successSnackBar(
          title: 'Congratulations',
          message: 'Your address has been saved successfully.');

      // Refresh Addresses Data
      refreshData.toggle();

      // Reset fields
      resetFormFields();

      // Redirect
      Navigator.of(Get.context!).pop();
    } catch (e) {
      // Remove Loader
      NxFullScreenLoader.stopLoading();

      // Show some Generic Error to the user
      NxLoaders.errorSnackBar(
          title: 'Address not found', message: e.toString());
    }
  }

  Future<dynamic> selectAddressPopup(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(NxSizes.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NxSectionHeading(
                      title: 'Select Address', showActionButton: false),
                  FutureBuilder(
                    future: getAllUserAddresses(),
                    builder: (_, snapshot) {
                      /// Helper Function: Handle Loader, No Record, or Error Message
                      final response =
                          NxCloudHelperFunctions.checkMultiRecordState(
                              snapshot: snapshot);
                      if (response != null) {
                        return response;
                      }

                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        itemBuilder: (_, index) {
                          return NxSingleAddress(
                            address: snapshot.data![index],
                            onTap: () async {
                              await selectAddress(snapshot.data![index]);
                              Get.back();
                            },
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(height: NxSizes.defaultSpace * 2),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () =>
                          Get.to(() => const AddNewAddressScreen()),
                      child: const Text('Add new address'),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  // @override
  // void dispose() {
  //   name.dispose();
  //
  //   super.dispose();
  // }
  /// Function to reset form fields
  void resetFormFields() {
    name.clear();
    phoneNumber.clear();
    street.clear();
    postalCode.clear();
    city.clear();
    state.clear();
    country.clear();
    addressFormKey.currentState?.reset();
  }
}
