import 'package:get/get.dart';
import 'package:nx_commerce/features/shop/models/product_model/product_model.dart';
import 'package:nx_commerce/utils/loaders/loaders.dart';

import '../../../data/repositories/product_repository/product_repository.dart';

class ProductController extends GetxController {
  static get instance => Get.find();

  @override
  void onInit() {
    featuredProducts();
    super.onInit();
  }


  /// Variables
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;
  final RxBool isLoading = false.obs;
  final productRepository = Get.put(ProductRepository());


  Future<void> fetchFeaturedProducts() async {
    try{
      /// Start Loading
      isLoading.value = true;

      /// Fetch Products
      final products = await productRepository.getFeaturedProducts();

      /// Assign Products
      featuredProducts.assignAll(products);

    }catch (e) {
     NxLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      /// Stop Loading
      isLoading.value = false;
    }
  }
}