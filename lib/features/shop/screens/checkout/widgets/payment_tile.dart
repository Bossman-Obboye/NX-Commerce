import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/features/shop/models/payment_method_model.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';

import '../../../../../common/widgets/custom_shapes/containers/rounded_container.dart';
import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/products/checkout_controller.dart';

class NxPaymentTile extends StatelessWidget {
  const NxPaymentTile({super.key, required this.paymentMethod});

  final PaymentMethodModel paymentMethod;
  @override
  Widget build(BuildContext context) {
    final controller = CheckoutController.instance;
    return ListTile(
      contentPadding: const EdgeInsets.all(0),
      onTap: (){
        controller.selectedPaymentMethod.value = paymentMethod;
        Get.back();
      },
      leading:   NxRoundedContainer(
        width: 60,
        height: 40,
        backgroundColor: NxHelpers.isDarkMode(context) ? NxColors.light : NxColors.white,
        padding: const EdgeInsets.all(NxSizes.sm),
        child: Image(image: AssetImage(paymentMethod.image), fit: BoxFit.contain),
      ),
      title: Text(paymentMethod.name),
      trailing: const Icon(Iconsax.arrow_right_34),
    );
  }
}
