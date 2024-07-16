import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/constants/sizes.dart';


class NxSocialButton extends StatelessWidget {
  const   NxSocialButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: NxColors.grey,
              ),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: NxSizes.iconMd,
              height: NxSizes.iconMd,
              image: AssetImage(NxImages.google),
            ),
          ),
        ),
        const SizedBox(
          width: NxSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: NxColors.grey,
              ),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            onPressed: () {},
            icon: const Image(
              width: NxSizes.iconMd,
              height: NxSizes.iconMd,
              image: AssetImage(NxImages.facebook),
            ),
          ),
        )
      ],
    );
  }
}
