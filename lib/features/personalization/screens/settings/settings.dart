import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:nx_commerce/common/widgets/list_tile/settings_menu_tile.dart';
import 'package:nx_commerce/common/widgets/text/section_heading.dart';
import 'package:nx_commerce/features/personalization/screens/profile/profile.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';
import '../../../../common/widgets/list_tile/user_profile_tile.dart';
import '../../../../utils/constants/colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Header
            NxPrimaryHeaderContainer(
              child: Column(
                children: [
                  NxAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(context).textTheme.headlineMedium!.apply(
                            color: NxColors.white,
                          ),
                    ),
                  ),

                  /// -- User Profile Card
                   NxUserProfileTile(
                    onTap: () => Get.to(()=> const ProfileScreen()),
                  ),
                  const SizedBox(height: NxSizes.spaceBtwSections),
                ],
              ),
            ),

            /// -- Body
            Padding(
              padding: const EdgeInsets.all(NxSizes.defaultSpace),
              child: Column(
                children: [
                  /// -- Account Settings
                  const NxSectionHeading(
                    title: "Account Settings",
                    showActionButton: false,
                  ),
                  const SizedBox(height: NxSizes.spaceBtwItems),

                  SettingsMenuTile(
                    title: "My Address",
                    subTitle: "Set shopping delivery address",
                    icon: Iconsax.safe_home,
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    title: "My Cart",
                    subTitle: "Add, remove and move to checkout",
                    icon: Iconsax.shopping_cart,
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    title: "My Orders",
                    subTitle: "In-progress and Completed Orders",
                    icon: Iconsax.bag_tick,
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    title: "Bank Account",
                    subTitle: "Withdraw balance to register bank account",
                    icon: Iconsax.bank,
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    title: "My Coupons",
                    subTitle: "List all the discount coupons",
                    icon: Iconsax.discount_shape,
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    title: "Notifications",
                    subTitle: "Set any kind of notification message",
                    icon: Iconsax.notification,
                    onTap: () {},
                  ),
                  SettingsMenuTile(
                    title: "Account Privacy",
                    subTitle: "Manage data usage and connected accounts",
                    icon: Iconsax.security_card,
                    onTap: () {},
                  ),

                  /// -- App Settings
                  const SizedBox(height: NxSizes.spaceBtwSections),
                  const NxSectionHeading(
                    title: "App Setting",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: NxSizes.spaceBtwItems,
                  ),
                  const SettingsMenuTile(
                      title: "Load Data",
                      subTitle: "Upload Data to your Cloud Firebase",
                      icon: Iconsax.document_upload),
                  SettingsMenuTile(
                      title: "Geolocation",
                      subTitle: "Set recommendation based on location",
                      icon: Iconsax.location,
                      trailing: Switch(value: true, onChanged: (value) {})),
                  SettingsMenuTile(
                      title: "Safe Mode",
                      subTitle: "Search result is safe for all ages",
                      icon: Iconsax.security_user,
                      trailing: Switch(value: false, onChanged: (value) {})),
                  SettingsMenuTile(
                      title: "HD Image Quality",
                      subTitle: "Set image quality to be seen",
                      icon: Iconsax.image,
                      trailing: Switch(value: false, onChanged: (value) {})),

                  /// -- Logout Button
                  const SizedBox(
                    height: NxSizes.spaceBtwSections,
                  ),

                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Text("Logout"),
                    ),
                  ),
                  const SizedBox(height: NxSizes.spaceBtwSections * 2.5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
