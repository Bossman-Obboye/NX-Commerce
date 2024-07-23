import 'package:flutter/material.dart';
import 'package:nx_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:nx_commerce/common/widgets/text/section_heading.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';

import '../../../../../utils/helpers/helpers.dart';

class NxBillingPaymentSection extends StatelessWidget {
  const NxBillingPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return  Column(
      children: [
        NxSectionHeading(title: 'Payment Method', btnText: 'Change', btnOnPressed: (){},),
        const SizedBox(height: NxSizes.spaceBtwItems / 2),
        Row(
          children: [
            NxRoundedContainer(
              width: 60,
              height: 35,
              backgroundColor: isDarkMode ? NxColors.light : NxColors.white,
              padding: const EdgeInsets.all(NxSizes.sm),
              child: const Image(image: AssetImage(NxImages.paypal), fit: BoxFit.contain),
            ),
            const SizedBox(width: NxSizes.spaceBtwItems / 2),
            Text('Paypal', style: Theme.of(context).textTheme.bodyLarge,)
          ],
        ),
      ],
    );
  }
}
