import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/features/authentication/controllers/forgot_passsword_controller/forgot_password_controller.dart';
import 'package:nx_commerce/features/authentication/screens/password_configuration/reset_password.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import 'package:nx_commerce/utils/constants/text_strings.dart';
import 'package:nx_commerce/utils/validators/validators.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgotPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(NxSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(NxTexts.forgotPasswordTitle,
                style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(
              height: NxSizes.spaceBtwItems,
            ),
            Text(NxTexts.forgotPasswordSubTitle,
                style: Theme.of(context).textTheme.labelMedium),
            const SizedBox(
              height: NxSizes.spaceBtwItems * 2,
            ),

            /// Text field
            Form(
              key: controller.forgotPasswordFormKey,
              child: TextFormField(
                controller: controller.emailController,
                decoration: const InputDecoration(
                    labelText: NxTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right)),
                validator: NxValidators.validateEmail,
              ),
            ),
            const SizedBox(
              height: NxSizes.spaceBtwSections,
            ),

            /// Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => controller.sendPasswordResetEmail(),
                child: const Text(NxTexts.submit),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
