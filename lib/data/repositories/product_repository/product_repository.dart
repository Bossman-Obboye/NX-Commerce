import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/product_model/product_model.dart';
import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/generic_exception.dart';
import '../../../utils/exceptions/platform_exception.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// FireStore instance for database interactions
  final _db = FirebaseFirestore.instance;


  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try{
      final snapshot = await _db.collection('Products').where('IsFeatured', isEqualTo: true).limit(4).get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();

    } on FirebaseException catch (e) {
      throw NxFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code).message;
    } catch (e) {
      throw NxGenericException.instance.message;
    }
  }
  
  
  // /// Upload dummy data to the Cloud Firebase
  // Future<void> uploadDummyData>(List<ProductModel> products) async {
  // }



}