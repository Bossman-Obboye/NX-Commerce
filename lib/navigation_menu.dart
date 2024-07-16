import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nx_commerce/features/shop/screens/home_screen.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    final controller = Get.put(NavigationController());
    return  Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          backgroundColor: isDarkMode ? NxColors.black : NxColors.white,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          destinations:const [
            NavigationDestination(icon: Icon(Iconsax.home), label: "Home"),
            NavigationDestination(icon: Icon(Iconsax.shop), label: "Store"),
            NavigationDestination(icon: Icon(Iconsax.heart), label: "Wishlist"),
            NavigationDestination(icon: Icon(Iconsax.user), label: "Profile"),
          ],
        ),
      ),
      body: Obx (()=> controller.screens[controller.selectedIndex.value]),
    );
  }
}



class NavigationController extends GetxController{
  final Rx<int> selectedIndex = 0.obs;

  final screens = [const HomeScreen(),Container(color: Colors.teal[700]),Container(color: Colors.teal[800]),Container(color: Colors.teal[900]),];



}
