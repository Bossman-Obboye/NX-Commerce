
import 'package:get/get.dart';
import 'package:nx_commerce/features/shop/controllers/products/variation_controller.dart';

import '../utils/helpers/network_manager.dart';

class GeneralBindings extends Bindings{
  @override
  void dependencies() {
    Get.put(NetworkManager());
    Get.put(VariationController());
  }

}