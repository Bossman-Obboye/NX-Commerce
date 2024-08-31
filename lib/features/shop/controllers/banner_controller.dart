import 'dart:async';

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
    // uploadBanners(bannersToUpload);
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

// Future<void> uploadBanners(List<BannerModel> banners) async {
//     for(int i = 0; i<banners.length; i ++) {
//       await FirebaseFirestore.instance.collection('Banners').add(banners[i].toJson()).then((docRef) {
//         debugPrint(docRef.toString());debugPrint("added banner $i");
//       });
//
//     }
// }

// final bannersToUpload = [
//   BannerModel(
//       active: true,
//       imageUrl:
//           'https://www.shutterstock.com/image-vector/blue-background-text-cyber-monday-vector-337250552'),
//   BannerModel(active: true, imageUrl: 'https://cdn.dribbble.com/userupload/11169292/file/original-f4a56ea51fca607ffa235c8bb3ca7b1e.jpg?resize=400x300&vertical=center'),
//   BannerModel(active: true, imageUrl: 'https://www.shutterstock.com/image-vector/banner-announcing-mega-discount-half-260nw-1962489325.jpg'),
//   BannerModel(active: true, imageUrl: 'https://previews.123rf.com/images/stickerside/stickerside2207/stickerside220700224/189444396-dont-miss-out-super-sale-promotion-banner-limited-time-only-price-discount-announcement-shopping.jpg'),
//   BannerModel(active: true, imageUrl: 'https://thumbs.dreamstime.com/z/flash-sale-hot-advertising-horizontal-poster-business-ecommerce-discount-promotion-gradient-template-marketing-banner-lightning-135930897.jpg'),
// ];
