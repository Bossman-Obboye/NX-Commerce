import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/features/shop/models/banner_model.dart';

import '../../../../utils/exceptions/firebase_exception.dart';
import '../../../../utils/exceptions/generic_exception.dart';
import '../../../../utils/exceptions/platform_exception.dart';

class BannersRepository extends GetxController {
  static BannersRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;


  /// Get all order related to current User
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db.collection('Banners').where('Active', isEqualTo: true).get();

      final list = result.docs.map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot)).toList();

      return list;
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