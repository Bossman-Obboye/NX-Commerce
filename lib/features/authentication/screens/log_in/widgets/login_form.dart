


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/features/authentication/screens/password_configuration/forgot_password_screen.dart';
import 'package:nx_commerce/features/authentication/screens/signup/signup.dart';
import 'package:nx_commerce/common/widgets/navigation_bar/navigation_menu.dart';
import '../../../../../utils/constants/sizes.dart';
import '../../../../../utils/constants/text_strings.dart';

class NxLoginForm extends StatelessWidget {
  const NxLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: NxSizes.spaceBtwSections),
        child: Column(
          children: [
            /// Email
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: NxTexts.email,
              ),
            ),

            const SizedBox(height: NxSizes.spaceBtwInputFields),

            /// Password
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: NxTexts.password,
                suffix: Icon(Iconsax.eye_slash),
              ),
            ),

            const SizedBox(height: NxSizes.spaceBtwInputFields / 2),

            /// Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember me
                Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {
                        // TODO: Add function
                      },
                    ),
                    const Text(NxTexts.rememberMe),
                  ],
                ),

                /// Forgot Password
                Flexible(
                  child: TextButton(
                    onPressed: ()=> Get.to(()=> const ForgotPasswordScreen()),
                    child: const Text(NxTexts.forgotPassword),
                  ),
                ),
              ],
            ),

            /// Sign In Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () { Get.offAll(()=> const NavigationMenu());
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


