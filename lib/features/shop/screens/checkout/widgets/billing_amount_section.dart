import 'package:flutter/material.dart';
import 'package:nx_commerce/utils/helpers/pricing_calc.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../controllers/products/cart_controller.dart';

class NxBillingAmountSection extends StatelessWidget {
  const NxBillingAmountSection({super.key});

  @override
  Widget build(BuildContext context){
  final cartController = CartController.instance;
  final subtotal = cartController.totalCartPrice.value;
    return  Column(
      children: [
        /// -- Subtotal
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Subtotal', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$${subtotal.toStringAsFixed(2)}', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: NxSizes.spaceBtwItems / 2),

        /// -- Shipping Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Shipping Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$${NxPricingCalculator.calculateShippingCost(subtotal, 'US')}', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: NxSizes.spaceBtwItems / 2),

        /// -- Tax Fee
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Tax Fee', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$${NxPricingCalculator.calculateTax(subtotal, 'US')}', style: Theme.of(context).textTheme.labelLarge),
          ],
        ),
        const SizedBox(height: NxSizes.spaceBtwItems / 2),

        /// -- Order Total
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order Total', style: Theme.of(context).textTheme.bodyMedium),
            Text('\$${NxPricingCalculator.calculateTotalPrice(subtotal, 'US')}', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
