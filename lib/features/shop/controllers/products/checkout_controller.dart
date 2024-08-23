import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/common/widgets/text/section_heading.dart';
import 'package:nx_commerce/features/shop/models/payment_method_model.dart';
import 'package:nx_commerce/features/shop/screens/checkout/widgets/payment_tile.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';

import '../../../../utils/constants/sizes.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  @override
  void onInit() {
    selectedPaymentMethod.value =
        PaymentMethodModel(name: 'Paypal', image: NxImages.paypal);
    super.onInit();
  }

  /// Variable
  final Rx<PaymentMethodModel> selectedPaymentMethod =
      PaymentMethodModel.empty().obs;

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (_) {
          return SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(NxSizes.lg),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const NxSectionHeading(title: 'Select Payment Method', showActionButton: false),
                  const SizedBox(height: NxSizes.spaceBtwSections),
                  NxPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paypal', image: NxImages.paypal)),
                const SizedBox(height: NxSizes.spaceBtwSections / 2),
                  NxPaymentTile(paymentMethod: PaymentMethodModel(name: 'Google Pay', image: NxImages.googlePay)),
                const SizedBox(height: NxSizes.spaceBtwSections / 2),
                  NxPaymentTile(paymentMethod: PaymentMethodModel(name: 'Apple Pay', image: NxImages.applePay)),
                const SizedBox(height: NxSizes.spaceBtwSections / 2),
                  NxPaymentTile(paymentMethod: PaymentMethodModel(name: 'Visa', image: NxImages.visa)),
                const SizedBox(height: NxSizes.spaceBtwSections / 2),
                  NxPaymentTile(paymentMethod: PaymentMethodModel(name: 'Master Card', image: NxImages.masterCard)),
                const SizedBox(height: NxSizes.spaceBtwSections / 2),
                  NxPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paytm', image: NxImages.darkAppLogo)),
                const SizedBox(height: NxSizes.spaceBtwSections / 2),
                  NxPaymentTile(paymentMethod: PaymentMethodModel(name: 'Paystack', image: NxImages.lightAppLogo)),
                const SizedBox(height: NxSizes.spaceBtwSections / 2),
                  NxPaymentTile(paymentMethod: PaymentMethodModel(name: 'Credit Card', image: NxImages.creditCard)),
                const SizedBox(height: NxSizes.spaceBtwSections / 2),
                const SizedBox(height: NxSizes.spaceBtwSections),
                ],
              ),
            ),
          );
        });
  }
}
