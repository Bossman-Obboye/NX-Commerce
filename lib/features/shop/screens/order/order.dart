 import 'package:flutter/material.dart';
import 'package:nx_commerce/common/widgets/appbar/appbar.dart';
import 'package:nx_commerce/features/shop/screens/order/widgets/order_list.dart';

import '../../../../utils/constants/sizes.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      /// -- Appbar
      appBar: NxAppBar(
          showBackArrow: true,
          title:
          Text("My Orders", style: Theme
              .of(context)
              .textTheme
              .headlineSmall)),
      body: const Padding(padding: EdgeInsets.all(NxSizes.defaultSpace),
          child: OrderListItems()),
    );
  }
}

