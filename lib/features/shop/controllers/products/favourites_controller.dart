import 'dart:convert';

import 'package:get/get.dart';
import 'package:nx_commerce/data/repositories/product_repository/product_repository.dart';
import 'package:nx_commerce/features/shop/models/product_model.dart';
import 'package:nx_commerce/utils/loaders/loaders.dart';
import 'package:nx_commerce/utils/local_storage/storage_utils.dart';

class FavouritesController extends GetxController {

  static FavouritesController get instance => Get.find();

  /// Variables
  final RxMap<String, bool> favorites = <String, bool>{}.obs;


  @override
  void onInit() {
    super.onInit();
    initFavorites();
  }


  // Method to initialize favourite by reading from storage
  Future<void> initFavorites() async {
    final json = NxLocalStorage.instance().readData('favorites');
    if(json != null) {
      final storedFavourites = jsonDecode(json) as Map<String, dynamic>;
      favorites.assignAll(storedFavourites.map((key, value) => MapEntry(key, value as bool)));
    }
  }

  bool isFavourite(String productId) {
    return favorites[productId] ?? false;
  }

  void toggleFavoriteProduct(String productId) {
    if(!favorites.containsKey(productId)) {
      favorites[productId] = true;
      saveFavoritesToStorage();
      NxLoaders.customToast(message: 'Product has been added to the WishList.');
    }else{
      NxLocalStorage.instance().removeData(productId);
      favorites.remove(productId);
      saveFavoritesToStorage();
      favorites.refresh();
      NxLoaders.customToast(message: 'Product has been removed to the WishList.');
    }
  }

  void saveFavoritesToStorage() {
    final encodedFavorites = json.encode(favorites);
    NxLocalStorage.instance().writeData('favorites', encodedFavorites);
  }

  Future<List<ProductModel>> favoriteProducts() async {
    return await ProductRepository.instance.getFavouriteProducts(favorites.keys.toList());
  }

}
