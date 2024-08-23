import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/common/widgets/navigation_bar/navigation_menu.dart';
import 'package:nx_commerce/common/widgets/success_screen/success_screen.dart';
import 'package:nx_commerce/data/repositories/auth_repo/auth_repository.dart';
import 'package:nx_commerce/features/personalization/controllers/address_controller.dart';
import 'package:nx_commerce/features/shop/controllers/products/cart_controller.dart';
import 'package:nx_commerce/features/shop/controllers/products/checkout_controller.dart';
import 'package:nx_commerce/utils/constants/enums.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/loaders/loaders.dart';
import 'package:nx_commerce/utils/popups/full_screen_loader.dart';

import '../../../../data/repositories/product_repo/order_repository/order_repository.dart';
import '../../models/order_model.dart';

class OrderController extends GetxController {
  static OrderController get instance => Get.find();

  /// Variables
  final cartController = CartController.instance;
  final addressController = AddressController.instance;
  final checkoutController = CheckoutController.instance;
  final orderRepository = Get.put(OrderRepository());

  /// Fetch user's order history
  Future<List<OrderModel>> fetchUserOrders() async {
    try {
      final userOrders = await orderRepository.fetchUserOrders();
      return userOrders;
    }  catch (e) {
      NxLoaders.warningSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// Add methods for orders processing
  void processOrder(double totalAmount) async {
    // Start Loader
    try {
      NxFullScreenLoader.openLoadingDialog('Processing your order', NxImages.darkAppLogo);

      // Get user authentication Id
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if(userId.isEmpty) return;

      // Add Details
      final order = OrderModel(
        // Generate a unique ID for the order
        id : UniqueKey().toString(),
        userId: userId,
        status: OrderStatus.pending,
        totalAmount: totalAmount,
        orderDate: DateTime.now(),
        paymentMethod: checkoutController.selectedPaymentMethod.value.name,
        address: addressController.selectedAddress.value,
        // Set Date as needed
        deliveryDate: DateTime.now(),
        items: cartController.cartItems.toList(),
      );

      // Save the order to FireStore
      await orderRepository.saveOrder(order, userId);

      // Update the cart status;
      cartController.clearCart();

      // Show Success screen
      Get.off(() => SuccessScreen(image: NxImages.staticSuccessIllustration, title: 'Payment Success!', subTitle: 'Your item will be shipped soon!', onPressed: ()=> Get.offAll(()=> const NavigationMenu()),),);
    }  catch (e) {
      NxLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    }

  }

}