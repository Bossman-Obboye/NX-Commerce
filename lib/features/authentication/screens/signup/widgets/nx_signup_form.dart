import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/features/authentication/controllers/signup/signup_controller.dart';
import 'package:nx_commerce/features/authentication/screens/signup/widgets/terms_conditions_checkbox.dart';
import 'package:nx_commerce/utils/validators/validators.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class NxSignUpForm extends StatelessWidget {
  const NxSignUpForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Form(
      key: controller.signupFormKey,
      child: Column(
        children: [
          Row(
            children: [
              /// First Name Text field
              Expanded(
                child: TextFormField(
                  controller: controller.firstNameController,
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: NxTexts.firstName,
                    prefixIcon: Icon(Icons.person),
                  ),
                  validator: (value) =>
                      NxValidators.validateEmptyText('First Name', value),
                ),
              ),
              const SizedBox(
                width: NxSizes.spaceBtwInputFields,
              ),

              /// Last Name Text field
              Flexible(
                child: TextFormField(
                  controller: controller.lastNameController,
                  expands: false,
                  decoration: const InputDecoration(
                    labelText: NxTexts.lastName,
                    prefixIcon: Icon(Iconsax.user),
                  ),
                  validator: (value) =>
                      NxValidators.validateEmptyText('Last Name', value),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: NxSizes.spaceBtwInputFields,
          ),

          /// Username Text field
          TextFormField(
            controller: controller.userNameController,
            expands: false,
            decoration: const InputDecoration(
              labelText: NxTexts.username,
              prefixIcon: Icon(Iconsax.user_edit),
            ),
            validator: (value) =>
                NxValidators.validateEmptyText('Username', value),
          ),
          const SizedBox(
            height: NxSizes.spaceBtwInputFields,
          ),

          /// Email Text field
          TextFormField(
            controller: controller.emailController,
            expands: false,
            decoration: const InputDecoration(
              labelText: NxTexts.email,
              prefixIcon: Icon(Iconsax.direct),
            ),
            validator: (value) => NxValidators.validateEmail(value),
          ),
          const SizedBox(
            height: NxSizes.spaceBtwInputFields,
          ),

          /// Phone Number Text field
          TextFormField(
              controller: controller.phoneNumberController,
              expands: false,
              decoration: const InputDecoration(
                labelText: NxTexts.phoneNo,
                prefixIcon: Icon(Iconsax.call),
              ),
              validator: (value) => NxValidators.validatePhoneNumber(value)),
          const SizedBox(
            height: NxSizes.spaceBtwInputFields,
          ),

          /// Password Text field
          Obx(
            () => TextFormField(
                controller: controller.passwordController,
                expands: false,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                  labelText: NxTexts.password,
                  prefixIcon: const Icon(Iconsax.password_check),
                  suffixIcon: IconButton(
                      onPressed: () {
                        controller.hidePassword.value =
                            !controller.hidePassword.value;
                      },
                      icon: Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye)),
                ),
                validator: (value) => NxValidators.validatePassword(value)),
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
              onPressed: () => controller.signup(),
              child: const Text(NxTexts.createAccount),
            ),
          ),
        ],
      ),
    );
  }
}
