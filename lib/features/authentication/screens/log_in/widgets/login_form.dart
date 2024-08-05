import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/common/widgets/navigation_bar/navigation_menu.dart';
import 'package:nx_commerce/features/authentication/screens/signup/signup.dart';
import 'package:nx_commerce/utils/validators/validators.dart';

import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';
import '../../../controllers/login/login_controller.dart';

class NxLoginForm extends StatelessWidget {
  const NxLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: NxSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: NxTexts.email,
              ),
              validator: (value) =>
                  NxValidators.validateEmptyText('Password', value),
            ),

            const SizedBox(height: NxSizes.spaceBtwInputFields),

            /// Password
            TextFormField(
              controller: controller.passwordController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: NxTexts.password,
                suffix: Icon(Iconsax.eye_slash),
              ),
              validator: (value) => NxValidators.validateEmail(value),
            ),

            const SizedBox(height: NxSizes.spaceBtwInputFields / 2),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember me
                Row(
                  children: [
                    Obx(
                () => Checkbox(
                          value: controller.rememberMe.value,
                          onChanged: (value) => controller.rememberMe.value =
                              !controller.rememberMe.value),
                    ),
                    const Text(NxTexts.rememberMe),
                  ],
                ),

                /// Forgot Password
                Obx(
                  () => TextFormField(
                      controller: controller.passwordController,
                      expands: false,
                      obscureText: controller.showPassword.value,
                      decoration: InputDecoration(
                        labelText: NxTexts.password,
                        prefixIcon: const Icon(Iconsax.password_check),
                        suffixIcon: IconButton(
                            onPressed: () {
                              controller.showPassword.value =
                                  !controller.showPassword.value;
                            },
                            icon: Icon(controller.showPassword.value
                                ? Iconsax.eye_slash
                                : Iconsax.eye)),
                      ),
                      validator: (value) =>
                          NxValidators.validatePassword(value)),
                ),
              ],
            ),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.emailAndPasswordSignIn();
                },
                child: const Text(NxTexts.signIn),
              ),
            ),

            const SizedBox(
              height: NxSizes.spaceBtwItems,
            ),

            /// Create Account Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignupScreen()),
                child: const Text(NxTexts.createAccount),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
