import 'package:get/get.dart';
import 'package:nx_commerce/data/repositories/product_repo/banners_repository/banners_repository.dart';
import 'package:nx_commerce/features/shop/models/banner_model.dart';

import '../../../utils/loaders/loaders.dart';

class BannerController extends GetxController {
  /// Variables
  final Rx<int> carouselCurrentIndex = 0.obs;
  final RxList<BannerModel> banners = <BannerModel>[].obs;
  final RxBool isLoading = false.obs;


  @override
  void onInit() {
    fetchBanners();
    super.onInit();
  }

  /// Update Page Navigational Data
  void updatePageIndicator(index) {
    carouselCurrentIndex.value = index;
  }

  /// Fetch Banners
  Future<void> fetchBanners() async {
    try {
      // Show Loader while loading categories
      isLoading.value = true;

      // Fetch Banners
      final bannerRepo = Get.put(BannersRepository());
      final banners = await bannerRepo.fetchBanners();

      // Assign Banners
      this.banners.assignAll(banners);

    } catch (e) {
      NxLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }
}