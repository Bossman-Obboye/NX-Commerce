import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:nx_commerce/features/shop/controllers/products/cart_controller.dart';
import 'package:nx_commerce/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:nx_commerce/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:nx_commerce/features/shop/screens/checkout/widgets/billing_payment_section.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';
import 'package:nx_commerce/utils/helpers/pricing_calc.dart';
import 'package:nx_commerce/utils/loaders/loaders.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/products/cart/coupon_code.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/products/order_controller.dart';
import '../cart/widgets/cart_items.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    final subTotal = controller.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = NxPricingCalculator.calculateTotalPrice(subTotal, 'US');
    final bool isDarkMode = NxHelpers.isDarkMode(context);
    return Scaffold(
      appBar: NxAppBar(
          showBackArrow: true,
          title: Text("Order Review",
              style: Theme.of(context).textTheme.headlineSmall)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(NxSizes.defaultSpace),
          child: Column(
            children: [
              /// -- Items in Cart
              const NxCartItems(showAddRemoveButtons: false),
              const SizedBox(height: NxSizes.spaceBtwSections),

              /// -- Coupon TextField
              const NxCouponCode(),
              const SizedBox(height: NxSizes.spaceBtwSections),

              /// -- Billing Section
              NxRoundedContainer(
                padding: const EdgeInsets.all(NxSizes.md),
                showBorder: true,
                backgroundColor: isDarkMode ? NxColors.black : NxColors.white,
                child: const Column(
                  children: [
                    /// -- Pricing
                    NxBillingAmountSection(),
                    SizedBox(height: NxSizes.spaceBtwSections),

                    /// -- Divider
                    Divider(),
                    SizedBox(height: NxSizes.spaceBtwSections),

                    /// -- Payment Methods
                    NxBillingPaymentSection(),
                    SizedBox(height: NxSizes.spaceBtwSections),

                    /// -- Address
                    NxBillingAddressSection(),
                    // SizedBox(height: NxSizes.spaceBtwSections),
                  ],
                ),
              )
            ],
          ),
          //
        ),
      ),

      /// -- Checkout Button
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(NxSizes.defaultSpace),
        child: ElevatedButton(
            onPressed:
            subTotal > 0 ? ()=> orderController.processOrder(totalAmount) :
            () => NxLoaders.warningSnackBar(title: 'Empty Cart', message: 'Add items in the cart in order to proceed'
                ),
            child: Text(
                "Checkout \$${NxPricingCalculator.calculateTotalPrice(subTotal, 'US')}")),
      ),
    );
  }
}

