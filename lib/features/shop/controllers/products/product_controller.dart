import 'dart:developer';

import 'package:get/get.dart';
import 'package:nx_commerce/features/shop/models/product_model.dart';
import 'package:nx_commerce/utils/constants/enums.dart';
import 'package:nx_commerce/utils/loaders/loaders.dart';
import 'package:nx_commerce/utils/popups/full_screen_loader.dart';

import '../../../../data/repositories/product_repo/product_repository/product_repository.dart';
import '../../../../utils/constants/image_strings.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  @override
  void onInit() {
    fetchFeaturedProducts();
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

  Future<void> uploadDummyProducts(List<ProductModel> prod) async {
    try{
      /// Start Loading
      NxFullScreenLoader.openLoadingDialog('Uploading Data', NxImages.darkAppLogo);

      /// Upload Products
      await productRepository.uploadDummyData(prod);

      /// Fetch Products
      await fetchAllFeaturedProducts();

      /// Display success
      NxLoaders.successSnackBar(title: 'Congratulations');

    }catch (e) {
      print('------------------------------------------');
      log(e.toString());
     NxLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
    } finally {
      /// Stop Loading
      NxFullScreenLoader.stopLoading();
    }
  }


  Future<List<ProductModel>> fetchAllFeaturedProducts() async {
    try{
      /// Fetch Products
      final products = await productRepository.getFeaturedProducts();
      return products;
    }catch (e) {
     NxLoaders.errorSnackBar(title: 'Oh Snap', message: e.toString());
     return [];
    }
  }


  /// Get the product price or price range for variations.
  String getProductPrice(ProductModel product) {
    double smallestPrice = double.infinity;
    double largestPrice = 0.0;

    // If no variations exist, return the simple price or sale price
    if(product.productType == ProductType.single.toString()) {
      return (product.salePrice > 0 ? product.salePrice : product.price).toString();
    }else {
      // Calculate the smallest and largest prices among variations
      for(var variation in product.productVariations!) {
        // Determine the price to consider (sale price if available,
        // otherwise regular price).
        double priceToConsider = variation.salePrice > 0.0 ? variation.salePrice : variation.price;

        // Update smallest and largest prices
        if(priceToConsider < smallestPrice) {
          smallestPrice = priceToConsider;
        }

        if(priceToConsider > largestPrice) {
          largestPrice = priceToConsider;
        }
      }

      // If smallest and largest prices are the same, return a single price
      if (smallestPrice.isEqual(largestPrice)) {
        return largestPrice.toString();
      }else {
        // Otherwise, return price range
        return '$smallestPrice - \$$largestPrice';
      }
    }
  }


  /// --  Calculate Discount Percentage
  String? calculateSalePercentage(double originalPrice, double? salePrice){
    if(salePrice == null || salePrice <= 0.0) return null;
    if(originalPrice <= 0) return null;

    double percentage = ((originalPrice - salePrice) / originalPrice) * 100;
    return percentage.toStringAsFixed(0);

  }


  /// -- Check Product Stock Status
  String getProductStockStatus (int stock) {
    return stock > 0 ? 'In Stock' : 'Out of Stock';
  }

}