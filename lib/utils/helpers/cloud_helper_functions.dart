import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../exceptions/firebase_exception.dart';
import '../exceptions/generic_exception.dart';
import '../exceptions/platform_exception.dart';

class NxCloudHelperFunctions {

  /// Helper functions to check the state of a single database record.
  ///
  /// Returns a Widget based on the state of the snapshot.
  /// If data is still loading, it returns a CircularProgressIndicator.
  /// If no data is found, it returns a generic 'No Data Found' message.
  /// If an error occurs, it returns a generic error message.
  /// Otherwise, it returns null.
  static Widget? checkSingleRecordState<T>(AsyncSnapshot<T> snapshot) {

    if (snapshot.connectionState == ConnectionState.waiting) {
      return const Center(child: CircularProgressIndicator());
    }

    if (!snapshot.hasData || snapshot.data == null) {
      return const Center(child: Text('No Data Found'));
    }

    if (snapshot.hasError) {
      return const Center(child: Text('Something went wrong.'));
    }
    return null;
  }


  /// Helper functions to check the state of multiple (lis) database record.
  ///
  /// Returns a Widget based on the state of the snapshot.
  /// If data is still loading, it returns a CircularProgressIndicator.
  /// If no data is found, it returns a generic 'No Data Found' message.
  /// If an error occurs, it returns a generic error message.
  /// Otherwise, it returns null.
  static Widget? checkMultiRecordState<T>(
      {required AsyncSnapshot<List<T>> snapshot, Widget? loader, Widget? error, Widget? nothingFound}) {

    if (snapshot.connectionState == ConnectionState.waiting) {
      return loader ?? const Center(child: CircularProgressIndicator());
    }

    if (!snapshot.hasData || snapshot.data == null) {
      return nothingFound ?? const Center(child: Text('No Data Found'));
    }

    if (snapshot.hasError) {
      return error ?? const Center(child: Text('Something went wrong.'));
    }
    return null;
  }

  /// Create a reference with an initial file path and name an retrieve the download URL
  static Future<String> getURLFromFilePathAndName(String path) async {
    try{
      if(path.isEmpty) return '';
      final ref = FirebaseStorage.instance.ref().child(path);
      final url = await ref.getDownloadURL();
      return url;
    } on FirebaseException catch (e) {
      throw NxFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code).message;
    } catch (e) {
      throw NxGenericException.instance.message;
    }
  }

}
