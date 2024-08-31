import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/data/services/firebase_service/nx_firebase_storage_service.dart';
import 'package:nx_commerce/utils/constants/enums.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';
import 'package:nx_commerce/utils/popups/full_screen_loader.dart';

import '../../../../features/shop/models/product_model.dart';
import '../../../../utils/exceptions/firebase_exception.dart';
import '../../../../utils/exceptions/generic_exception.dart';
import '../../../../utils/exceptions/platform_exception.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  /// FireStore instance for database interactions
  final _db = FirebaseFirestore.instance;

  /// Get limited featured products
  Future<List<ProductModel>> getFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .limit(4)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw NxFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code).message;
    } catch (e) {
      throw NxGenericException.instance.message;
    }
  }

  /// Get limited featured products
  Future<List<ProductModel>> getAllFeaturedProducts() async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where('IsFeatured', isEqualTo: true)
          .get();
      return snapshot.docs.map((e) => ProductModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw NxFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code).message;
    } catch (e) {
      throw NxGenericException.instance.message;
    }
  }

  Future<List<ProductModel>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot = await query.get();
      final List<ProductModel> productList = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw NxFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code).message;
    } catch (e) {
      throw NxGenericException.instance.message;
    }
  }

  /// Get Products based on the Query
  Future<List<ProductModel>> getFavouriteProducts(
      List<String> productIds) async {
    try {
      final snapshot = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      final List<ProductModel> productList = snapshot.docs
          .map((querySnapshot) => ProductModel.fromSnapshot(querySnapshot))
          .toList();
      return productList;
    } on FirebaseException catch (e) {
      throw NxFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code).message;
    } catch (e) {
      throw NxGenericException.instance.message;
    }
  }

  Future<List<ProductModel>> getProductsForBrand(
      {required String brandId, int limit = -1}) async {
    try {
      final querySnapshot = limit == -1
          ? await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .get()
          : await _db
              .collection('Products')
              .where('Brand.Id', isEqualTo: brandId)
              .limit(limit)
              .get();
      final products = querySnapshot.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();

      return products;
    } on FirebaseException catch (e) {
      throw NxFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code).message;
    } catch (e) {
      throw NxGenericException.instance.message;
    }
  }

  Future<List<ProductModel>> getProductsForCategory(
      {required String categoryId, int limit = -1}) async {
    try {
      final productCategoryQuery = limit == -1
          ? await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .get()
          : await _db
              .collection('ProductCategory')
              .where('categoryId', isEqualTo: categoryId)
              .limit(limit)
              .get();

      // Extract productIds for all the documents
      List<String> productIds = productCategoryQuery.docs
          .map((doc) => doc['productId'] as String)
          .toList();

      // Query to get all documents where the brandId is in the list of brandIds, FieldPath.documentId to query document in collection.
      final productsQuery = await _db
          .collection('Products')
          .where(FieldPath.documentId, whereIn: productIds)
          .get();

      // Extract brand names or other relevant data from the documents
      final List<ProductModel> products = productsQuery.docs
          .map((doc) => ProductModel.fromQuerySnapshot(doc))
          .toList();

      return products;
    } on FirebaseException catch (e) {
      throw NxFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw NxPlatformException(code: e.code).message;
    } catch (e) {
      throw NxGenericException.instance.message;
    }
  }

  /// Upload dummy data to the Cloud Firebase
  Future<void> uploadDummyData(List<ProductModel> products) async {
    try {

      // Upload all the products along with their images
      final storage = Get.put(NxFirebaseStorageService());

      // Loop through each product
      for (var product in products) {
        // Get image data link from local assets
        final thumbnail =
            await storage.getImageDataFromAssets(product.thumbnail);

        // Upload image and get its URL
        final url = await storage.uploadImageData(
            'Products/Images', thumbnail, product.thumbnail.toString());

        // Assign URL to product.thumbnail attribute
        product.thumbnail = url;

        // Product list images
        if (product.images != null && product.images!.isNotEmpty) {
          List<String> imageUrl = [];
          for (var image in product.images!) {
            // Get image data link from local assets
            final assetImage = await storage.getImageDataFromAssets(image);

            // Upload image and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetImage, image);

            // Assign URL to product.thumbnail attribute
            imageUrl.add(url);
          }
          product.images!.clear();
          product.images!.addAll(imageUrl);
        }

        // Upload Variation Images
        if (product.productType == ProductType.variable.toString()) {
          for (var variation in product.productVariations!) {
            // Get image data link from local assets
            final assetsImage =
                await storage.getImageDataFromAssets(variation.image);

            // Upload images and get its URL
            final url = await storage.uploadImageData(
                'Products/Images', assetsImage, variation.image);

            // Assign URL to variation.image attribute
            variation.image = url;
          }

          // store product in FireStore
         await _db.collection('Products').add(product.toJson());
         
          // await _db
          //     .collection('Products')
          //     .doc(product.id)
          //     .set(product.toJson());
        }

      }
    } on FirebaseException catch (e) {
      throw e.message!;
    }on SocketException catch (e) {
      throw e.message;
    } on PlatformException catch (e) {
      throw e.message!;
    } catch (e) {
      throw e.toString();
    } finally
        {
          // Stop Loading
          NxFullScreenLoader.stopLoading();
        }
  }
}
