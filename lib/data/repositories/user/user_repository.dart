import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/data/repositories/auth_repo/auth_repository.dart';
import 'package:nx_commerce/features/authentication/models/user/user_model.dart';
import 'package:nx_commerce/utils/exceptions/format_exception.dart';
import 'package:nx_commerce/utils/exceptions/generic_exception.dart';
import 'package:nx_commerce/utils/exceptions/platform_exception.dart';

import '../../../utils/exceptions/firebase_auth_exception.dart';
import '../../../utils/exceptions/firebase_exception.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  /// VARIABLES
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Function to save user data to Firebase.
  Future<void> saveUserRecord(UserModel user) async {
    try {
      await _db.collection('Users').doc(user.id).set(user.toJson());
    } on FirebaseAuthException catch (e) {
      throw NxFirebaseAuthException(
        e.code,
      );
    } on FirebaseException catch (e) {
      throw NxFirebaseException(e.code);
    } on FormatException catch (_) {
      throw NxFormatException().message;
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code);
    } catch (e) {
      throw NxGenericException.instance.message;
    }
  }

  /// Function to fetch user details based on user ID.
  Future<UserModel> fetchUserDetails() async {
    try {
      final documentSnapshot = await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .get();
      if (documentSnapshot.exists) {
        return UserModel.fromSnapshot(documentSnapshot);
      } else {
        return UserModel.empty();
      }
    } on FirebaseAuthException catch (e) {
      throw NxFirebaseAuthException(
        e.code,
      );
    } on FirebaseException catch (e) {
      throw NxFirebaseException(e.code);
    } on FormatException catch (_) {
      throw NxFormatException().message;
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code);
    } catch (e) {
      throw NxGenericException.instance.message;
    }
  }

  /// Function to update user data in Firestore
  Future<void> updateUserDetails(UserModel updateUser) async {
    try {
      await _db
          .collection('Users')
          .doc(updateUser.id)
          .update(updateUser.toJson());
    } on FirebaseAuthException catch (e) {
      throw NxFirebaseAuthException(
        e.code,
      );
    } on FirebaseException catch (e) {
      throw NxFirebaseException(e.code);
    } on FormatException catch (_) {
      throw NxFormatException().message;
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code);
    } catch (e) {
      throw NxGenericException.instance.message;
    }
  }

  /// Update any field in a specific User Collection
  Future<void> updateSingleField(Map<String, dynamic> json) async {
    try {
      await _db
          .collection('Users')
          .doc(AuthenticationRepository.instance.authUser?.uid)
          .set(json);
    } on FirebaseAuthException catch (e) {
      throw NxFirebaseAuthException(
        e.code,
      );
    } on FirebaseException catch (e) {
      throw NxFirebaseException(e.code);
    } on FormatException catch (_) {
      throw NxFormatException().message;
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code);
    } catch (e) {
      throw NxGenericException.instance.message;
    }
  }

  /// Function to remove user data from Firestore.
  Future<void> removeUserRecord(String userId) async {
    try {
      await _db.collection('Users').doc(userId).delete();
    } on FirebaseAuthException catch (e) {
      throw NxFirebaseAuthException(
        e.code,
      );
    } on FirebaseException catch (e) {
      throw NxFirebaseException(e.code);
    } on FormatException catch (_) {
      throw NxFormatException().message;
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code);
    } catch (e) {
      throw NxGenericException.instance.message;
    }
  }
}
