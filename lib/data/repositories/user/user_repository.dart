import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/features/authentication/models/user/user_model.dart';
import 'package:nx_commerce/utils/exceptions/firebase_exception.dart';
import 'package:nx_commerce/utils/exceptions/format_exception.dart';
import 'package:nx_commerce/utils/exceptions/generic_exception.dart';
import 'package:nx_commerce/utils/exceptions/platform_exception.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firebase.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw NxFirebaseException(code: e.code, message: e.message);
    } on FirebaseException catch (e) {
      throw NxFirebaseException(code: e.code, message: e.message);
    } on FormatException catch (_) {
      throw NxFormatException().message;
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code);
    } catch (e) {
      throw NxGenericException().message;
    }
  }
}
