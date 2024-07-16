import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/common/widgets/login_signup/login_form_divider.dart';
import 'package:nx_commerce/common/widgets/login_signup/nx_social_buttons.dart';
import 'package:nx_commerce/features/authentication/screens/signup/widgets/nx_signup_form.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import '../../../../utils/constants/text_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(NxSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              /// Title
              Text( NxTexts.signupTitle,  style: Theme.of(context).textTheme.headlineMedium),

              const SizedBox(height: NxSizes.spaceBtwSections),

              /// Sign Up Form
              const NxSignUpForm(),
              const SizedBox(height: NxSizes.spaceBtwSections,),


              /// Divider
              NxFormDivider(dividerText: NxTexts.orSignInWith.capitalize!),
              const SizedBox(height: NxSizes.spaceBtwSections,),


              /// Social Buttons
              const NxSocialButton()
            ],

          ),
        ),
      ),
    );
  }
}

