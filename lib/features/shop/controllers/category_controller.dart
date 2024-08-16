
import 'package:get/get.dart';
import 'package:nx_commerce/data/repositories/category/category_repository.dart';
import 'package:nx_commerce/features/shop/models/category_model.dart';
import 'package:nx_commerce/utils/loaders/loaders.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  /// Variables
  final RxBool isLoading = false.obs;
  final _categoryRepository = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;


  /// -- Load Category data
  Future<void> fetchCategories() async {
    try{
      // Show Loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source (Firestore,  API, etc.)
      final categories = await _categoryRepository.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(allCategories.where((category) => category.isFeatured && category.parentId.isEmpty).take(8).toList());

    }catch (e) {
      NxLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());

    }finally{
      // Remove Loader
      isLoading.value = false;
    }
  }

  /// -- Load Selected category data


  /// Get Category or Sub-Category Products.


}