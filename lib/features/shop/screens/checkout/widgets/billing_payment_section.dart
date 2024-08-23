import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:nx_commerce/common/widgets/text/section_heading.dart';
import 'package:nx_commerce/features/shop/controllers/products/checkout_controller.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';

import '../../../../../utils/helpers/helpers.dart';

class NxBillingPaymentSection extends StatelessWidget {
  const NxBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    final controller = CheckoutController.instance;
    return Column(
      children: [
        NxSectionHeading(
            title: 'Payment Method',
            btnText: 'Change',
            btnOnPressed: () => controller.selectPaymentMethod(context)),
        const SizedBox(height: NxSizes.spaceBtwItems / 2),
        Obx(
          ()=> Row(
            children: [
              NxRoundedContainer(
                width: 60,
                height: 35,
                backgroundColor: isDarkMode ? NxColors.light : NxColors.white,
                padding: const EdgeInsets.all(NxSizes.sm),
                child: Image(
                    image: AssetImage(controller.selectedPaymentMethod.value.image), fit: BoxFit.contain),
              ),
              const SizedBox(width: NxSizes.spaceBtwItems / 2),
              Text(
                controller.selectedPaymentMethod.value.name,
                style: Theme.of(context).textTheme.bodyLarge,
              )
            ],
          ),
        ),
      ],
    );
  }
}
