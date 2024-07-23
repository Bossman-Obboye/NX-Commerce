import 'package:flutter/material.dart';

import '../../../../../utils/constants/sizes.dart';

class NxBillingAmountSection extends StatelessWidget {
  const NxBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        /// -- Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$256.00', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: NxSizes.spaceBtwItems / 2),

        /// -- Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6.00', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: NxSizes.spaceBtwItems / 2),

        /// -- Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$6.00', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: NxSizes.spaceBtwItems / 2),

        /// -- Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$256.00', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
