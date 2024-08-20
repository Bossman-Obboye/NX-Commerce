import 'package:get/get.dart';
import 'package:nx_commerce/data/repositories/product_repository/product_repository.dart';
import 'package:nx_commerce/features/shop/models/brand_model.dart';

import '../../../data/repositories/brand_repository/brand_repository.dart';
import '../../../utils/loaders/loaders.dart';
import '../models/product_model.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  @override
  void onInit() {
    getFeaturedBrands();
    super.onInit();
  }

  /// -- Variables
  RxBool isLoading = false.obs;
  final RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
  final RxList<BrandModel> allBrands =  <BrandModel>[].obs;
  final brandRepository = Get.put(BrandRepository());

  /// -- Load Brands
  Future<void> getFeaturedBrands() async {
    try {
      // Show Loader while loading categories
      isLoading.value = true;

      final brands = await brandRepository.getAllBrands();

      // Assign Brands
      allBrands.assignAll(brands);

      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured ?? false).take(4));

    } catch (e) {
      NxLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }


  /// -- Get Brands for Category
  Future<List<BrandModel>> getBrandForCategory(String categoryId) async {
    try {
      final brands = await brandRepository.getBrandsForCategory(categoryId);
      return brands;
    } catch (e) {
      NxLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }

  /// -- Get Brand Specific Products form your data source.
  Future<List<ProductModel>> getBrandProducts({required String brandId, int limit = -1}) async {
    try {
      final products = await ProductRepository.instance.getProductsForBrand(brandId: brandId, limit: limit);
      return products;
    } catch (e) {
      NxLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      return [];
    }
  }


}
