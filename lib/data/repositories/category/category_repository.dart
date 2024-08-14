import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/features/shop/models/category_model.dart';

import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/generic_exception.dart';
import '../../../utils/exceptions/platform_exception.dart';

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
    } on FirebaseAuthException catch (e) {
      throw NxFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code).message;
    } catch (e) {
      throw NxGenericException.instance.message;
    }
  
  }

  /// Get Sub Categories


  /// Upload Categories to the Cloud FireStore


}