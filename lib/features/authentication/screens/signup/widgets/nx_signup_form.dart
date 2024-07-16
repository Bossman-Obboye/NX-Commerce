import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/features/authentication/screens/signup/verify_email.dart';
import 'package:nx_commerce/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class NxSignUpForm extends StatelessWidget {
  const NxSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Row(
            children: [
              /// First Name Text field
              Expanded(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: NxTexts.firstName,
                      prefixIcon: Icon(Icons.person)),
                ),
              ),
              const SizedBox(
                width: NxSizes.spaceBtwInputFields,
              ),

              /// Last Name Text field
              Flexible(
                child: TextFormField(
                  expands: false,
                  decoration: const InputDecoration(
                      labelText: NxTexts.lastName,
                      prefixIcon: Icon(Iconsax.user)),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: NxSizes.spaceBtwInputFields,
          ),

          /// Username Text field
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: NxTexts.username,
                prefixIcon: Icon(Iconsax.user_edit)),
          ),
          const SizedBox(
            height: NxSizes.spaceBtwInputFields,
          ),

          /// Email Text field
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
                labelText: NxTexts.email, prefixIcon: Icon(Iconsax.direct)),
          ),
          const SizedBox(
            height: NxSizes.spaceBtwInputFields,
          ),

          /// Phone Number Text field
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: NxTexts.phoneNo,
              prefixIcon: Icon(Iconsax.call),
            ),
          ),
          const SizedBox(
            height: NxSizes.spaceBtwInputFields,
          ),

          /// Password Text field
          TextFormField(
            expands: false,
            decoration: const InputDecoration(
              labelText: NxTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
          ),
          const SizedBox(
            height: NxSizes.spaceBtwSections,
          ),

          /// Terms&Conditions Checkbox
          const TermsAndConditionsCheckbox(),
          const SizedBox(
            height: NxSizes.spaceBtwSections,
          ),

          /// Sign In Button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => Get.to(() => const VerifyEmailScreen()),
              child: const Text(NxTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
