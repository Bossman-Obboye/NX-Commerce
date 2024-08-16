import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/features/shop/models/category_model.dart';

import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/generic_exception.dart';
import '../../../utils/exceptions/platform_exception.dart';
import '../../services/firebase_service/nx_firebase_storage_service.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all Categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      // Get all the data from the Firebase Store.
      final snapshot = await _db.collection('Categories').get();

      // Convert all the data to -CategoryModel- and then to -List-
      final list = snapshot.docs.map((document) => CategoryModel.fromSnapshot(document)).toList();

      return list;
    } on FirebaseException catch (e) {
      throw NxFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code).message;
    } catch (e) {
      throw NxGenericException.instance.message;
    }
  
  }

  /// Get Sub Categories


  /// Upload Categories to the Cloud FireStore
  Future<void> uploadDummyData(List<CategoryModel> categories) async {

    try{
      // Upload all the Categories along with their Images
      final storage = Get.put(NxFirebaseStorageService());

      // Loop through each category
      for(var category in categories) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // Upload Image and Get its URL
        final url = await storage.uploadImageData('Categories', file, category.image);

        // Store Category in Firestore
        await _db.collection("Categories").doc(category.id).set(category.toJson());
      }


    } on FirebaseException catch (e) {
  throw NxFirebaseException(e.code).message;
  } on PlatformException catch (e) {
  throw NxPlatformException(code: e.code).message;
  } catch (e) {
  throw NxGenericException.instance.message;
  }
  }

}
