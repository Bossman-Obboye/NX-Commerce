import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/features/shop/models/brand_model/brand_model.dart';

import '../../../utils/exceptions/firebase_exception.dart';
import '../../../utils/exceptions/generic_exception.dart';
import '../../../utils/exceptions/platform_exception.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;


  /// Get all category
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();

      final result = snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();

      return result;

    } on FirebaseException catch (e) {
      throw NxFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const FormatException();
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code).message;
    } catch (e) {
      throw NxGenericException.instance.message;
    }

  }

/// Upload Banners to the Cloud Firebase


}