import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/features/personalization/controllers/user_controller.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';

import '../../../../utils/constants/text_strings.dart';
import '../../../../utils/validators/validators.dart';

class ReAuthLoginForm extends StatelessWidget {
  const ReAuthLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return Scaffold(
      appBar: AppBar(title: const Text('Re-Authenticate User')),
      body: SingleChildScrollView(
        child: Padding(
            padding: const EdgeInsets.all(NxSizes.defaultSpace),
            child: Form(
              key: controller.reAuthFormKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Email
                  TextFormField(
                    controller: controller.verifyEmail,
                    validator: NxValidators.validateEmail,
                    expands: false,
                    decoration: const InputDecoration(
                        labelText: NxTexts.email,
                        prefixIcon: Icon(Iconsax.direct_right)),
                  ),
                  const SizedBox(height: NxSizes.spaceBtwSections),

                  /// Password
                  Obx(
                    () => TextFormField(
                      obscureText: controller.hidePassword.value,
                      controller: controller.verifyPassword,
                      validator: (value) =>
                          NxValidators.validateEmptyText('Password', value),
                      decoration: InputDecoration(
                        labelText: NxTexts.lastName,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                          onPressed: () => controller.hidePassword.value =
                              !controller.hidePassword.value,
                          icon: Icon(controller.hidePassword.value
                              ? Iconsax.eye_slash
                              : Iconsax.eye),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: NxSizes.spaceBtwSections),

                  /// Login Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () =>
                          controller.reAuthenticateEmailAndPasswordUser(),
                      child: const Text('verify'),
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }
}