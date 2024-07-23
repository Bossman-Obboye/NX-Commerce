import 'package:flutter/material.dart';
import 'package:nx_commerce/common/widgets/text/section_heading.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';


class NxBillingAddressSection extends StatelessWidget {
  const NxBillingAddressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        NxSectionHeading(title: 'Shipping Address', btnText: 'Change', btnOnPressed: (){},),
        Text('Nx Generation', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: NxSizes.spaceBtwItems / 2),
        Row(
          children: [
          const Icon(Icons.phone, color: Colors.grey, size: 16),
            const SizedBox(width: NxSizes.spaceBtwItems),
            Text('+92-317-8059525', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: NxSizes.spaceBtwItems / 2),
          Row(
          children: [
          const Icon(Icons.location_history, color: Colors.grey, size: 16),
            const SizedBox(width: NxSizes.spaceBtwItems),
            Text('South Liana, Maine 87695, USA', style: Theme.of(context).textTheme.bodyMedium, softWrap: true),
          ],
        ),
      ],
    );
  }
}
