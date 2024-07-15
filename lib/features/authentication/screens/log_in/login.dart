import 'package:flutter/material.dart';
import 'package:nx_commerce/common/styles/spacing_styles.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/constants/text_strings.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = NxHelpers.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: NxSpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              Column(
                children: [
                  Image(
                    height: 150,
                    image: AssetImage(
                      isDarkMode ? NxImages.lightAppLogo : NxImages.darkAppLogo,
                    ),
                  ),

                  Text(NxTexts.loginTitle, style: Theme.of(context).textTheme.headlineMedium,),
                  const SizedBox(height: NxSizes.sm,),
                  Text(NxTexts.loginSubTitle, style: Theme.of(context).textTheme.bodyMedium,),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
