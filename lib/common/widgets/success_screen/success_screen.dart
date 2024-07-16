import 'package:flutter/material.dart';
import 'package:nx_commerce/common/styles/spacing_styles.dart';
import '../../../utils/constants/sizes.dart';
import '../../../utils/constants/text_strings.dart';
import '../../../utils/helpers/helpers.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key, required this.image, required this.title, required this.subTitle, required this.onPressed});

  final String image, title, subTitle;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: NxSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              /// Image
              Image(image: AssetImage(image),
                width: NxHelpers.screenWidth() * 0.6,
                height: NxHelpers.screenHeight() * 0.3,
              ),
              const SizedBox(height: NxSizes.spaceBtwSections,),

              /// Title
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox(height: NxSizes.spaceBtwItems),

              /// SubTitle
              Text(subTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox(height: NxSizes.spaceBtwSections),

              /// Button
              SizedBox(width: double.infinity, child: ElevatedButton(onPressed: onPressed, child: const Text(NxTexts.tContinue), ),),
            ],


          ),
        ),
      ),
    );
  }
}
