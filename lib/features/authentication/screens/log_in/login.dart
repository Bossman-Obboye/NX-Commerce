import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/common/styles/spacing_styles.dart';
import 'package:nx_commerce/features/authentication/screens/log_in/widgets/login_form.dart';
import 'package:nx_commerce/common/widgets/login_signup/login_form_divider.dart';
import 'package:nx_commerce/features/authentication/screens/log_in/widgets/login_header.dart';
import 'package:nx_commerce/common/widgets/login_signup/nx_social_buttons.dart';
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
              /// Header
              /// Logo, Title and SubTitle
              NxLoginHeader(isDarkMode: isDarkMode),

              /// Form
              /// TextFields, Sign_in and Create_Account buttons
              const NxLoginForm(),

              /// Divider
              NxFormDivider(dividerText: NxTexts.orSignInWith.capitalize!,),

              const SizedBox(height: NxSizes.spaceBtwSections ),

              /// Footer
              /// Facebook and Google
             const  NxSocialButton()
            ],
          ),
        ),
      ),
    );
  }
}

