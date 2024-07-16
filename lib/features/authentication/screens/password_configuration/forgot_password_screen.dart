import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/constants/text_strings.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
     appBar:  AppBar(),
      body:  Padding(
        padding: const EdgeInsets.all(NxSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(NxTexts.forgotPasswordTitle, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: NxSizes.spaceBtwItems,),
            Text(NxTexts.forgotPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(height: NxSizes.spaceBtwItems * 2,),

            /// Text field
            TextFormField(decoration: const InputDecoration(labelText: NxTexts.email, prefixIcon: Icon(Iconsax.direct_right)),),
            const SizedBox(height: NxSizes.spaceBtwSections,),

            /// Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Get.off(()=> const  ResetPasswordScreen()),
                child: const Text(NxTexts.submit),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
