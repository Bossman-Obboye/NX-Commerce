
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/common/widgets/images/circular_image.dart';
import 'package:nx_commerce/common/widgets/text/section_heading.dart';
import 'package:nx_commerce/features/personalization/controllers/user_controller.dart';
import 'package:nx_commerce/features/personalization/screens/profile/change_name.dart';
import 'package:nx_commerce/features/personalization/screens/profile/widgets/profile_menu.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/helpers.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return Scaffold(
      appBar: NxAppBar(
        title: Text("Profile",
            style: const TextStyle()
                .copyWith(color: isDarkMode ? NxColors.white : NxColors.black)),
        showBackArrow: true,
      ),

      /// -- Body
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(NxSizes.defaultSpace),
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    /// -- Profile Picture
                    const NxCircularImage(
                      image: NxImages.user,
                      width: 80,
                      height: 80,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text("Change Profile Picture"),
                    ),
                  ],
                ),
              ),
      //
      //         /// -- Details
              const SizedBox(height: NxSizes.spaceBtwItems / 2),
              const Divider(),
              const SizedBox(height: NxSizes.spaceBtwItems),
      //
              /// -- Heading Profile Info
              const NxSectionHeading(
                title: "Profile Information",
                showActionButton: false,
              ),
              const SizedBox(
                height: NxSizes.spaceBtwItems,
              ),

              ProfileMenu(
                title: "Name",
                value: controller.user.value.fullName,
                onPressed: () => Get.to(() => const ChangeName()),
              ),
              ProfileMenu(
                title: "Username",
                value: controller.user.value.username,
                onPressed: () {},
              ),

              const SizedBox(height: NxSizes.spaceBtwItems),
              const Divider(),
              const SizedBox(height: NxSizes.spaceBtwItems),

              /// -- Heading Personal Info
              const NxSectionHeading(
                title: "Personal Information",
                showActionButton: false,
              ),
              const SizedBox(
                height: NxSizes.spaceBtwItems,
              ),

               ProfileMenu(
                 title: "User ID",
                 value: controller.user.value.id,
                 onPressed: () {},
                 icon: Iconsax.copy,
               ),
               ProfileMenu(
                 title: "E-mail",
                 value: controller.user.value.email,
                 onPressed: () {},
               ),
               ProfileMenu(
                 title: "Phone Number",
                 value: controller.user.value.phoneNumber.isEmpty ? 'Empty' : controller.user.value.phoneNumber,
                 onPressed: () {},
               ),
               ProfileMenu(
                 title: "Gender",
                 value: "Male",
                 onPressed: () {},
               ),
               ProfileMenu(
                 title: "Date of Birth",
                 value: "02 Jul, 2000",
                 onPressed: () {},
               ),
               const Divider(),
               const SizedBox(
                 height: NxSizes.spaceBtwItems,
               ),
               TextButton(
                 onPressed: () {},
                 child: const Text(
                   "Close Account",
                   style: TextStyle(
                     color: Colors.red,
                   ),
                 ),
               ),
            ],
          ),
        ),
      ),
    );
  }
}
