import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:nx_commerce/utils/constants/enums.dart';
import 'package:nx_commerce/utils/constants/image_strings.dart';

import 'brand_model.dart';
import 'product_attribute_model.dart';
import 'product_variation_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;
  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;

  ProductModel(
      {required this.id,
      required this.stock,
      this.sku,
      required this.price,
      required this.title,
      this.date,
      this.salePrice = 0.0,
      required this.thumbnail,
      this.isFeatured,
      this.brand,
      this.description,
      this.categoryId,
      this.images,
      required this.productType,
      this.productAttributes,
      this.productVariations});
  
  /// Create Empty function for clean code
  static ProductModel empty() => ProductModel(id: 'id', stock: 0, price: 0, title: '', thumbnail: '', productType: '');

  /// Convert ProductModel to Json format to be stored in FirebaseStore.
  toJson() {
    return {
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images,
      'Thumbnail': thumbnail,
      'SalePrice': salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand!.toJson(),
      'Description': description,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null
          ? productAttributes!.map((e) => e.toJson()).toList()
          : [],
      'ProductVariations': productVariations != null
          ? productVariations!.map((e) => e.toJson()).toList()
          : [],
    };
  }

  /// Map Json oriented document snapshot from Firebase to Model
  factory ProductModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() == null) return ProductModel.empty();
    final data = document.data()!;
    return ProductModel(
        id: document.id,
        title: data['Title'],
        stock: data['Stock'] ?? 0,
        price: double.parse((data['Price'] ?? 0.0).toString()),
        isFeatured: data['IsFeatured'] ?? false,
        thumbnail: data['Thumbnail'] ?? '',
        description : data['Description'] ?? '',
        brand: BrandModel.fromJson(data['Brand']),
        images: data['Images'] != null ? List<String>.from(data['Images']) : [],
        salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
        sku: data['SKU'],
        categoryId: data['CategoryId'] ?? '',
        productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
        productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
        productType: data['ProductType'] ?? '',
    );
  }

  /// Map Json-oriented document snapshot from Firebase to Model
  factory ProductModel.fromQuerySnapshot(
      QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String,dynamic>;
    return ProductModel(
      id: document.id,
      sku: data['SKU'],
      title: data['Title'],
      stock: data['Stock'] ?? 0,
      isFeatured: data['IsFeatured'] ?? false,
      price: double.parse((data['Price'] ?? 0.0).toString()),
      salePrice: double.parse((data['SalePrice'] ?? 0.0).toString()),
      thumbnail: data['Thumbnail'] ?? '',
      categoryId: data['CategoryId'] ?? '',
      description : data['Description'] ?? '',
      productType: data['ProductType'] ?? '',
      brand: BrandModel.fromJson(data['Brand']),
      images: data['Images'] != null ? List<String>.from(data['Images']) : [],
      productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e)).toList(),
      productVariations: (data['ProductVariations'] as List<dynamic>).map((e) => ProductVariationModel.fromJson(e)).toList(),
    );
  }

}

final ProductModel demoProduct = ProductModel(
  id: '001',
  sku: 'jLhy',
  title: 'Wiersoon Large Business Laptop Backpack- Black',
  stock: 15,
  price: 10,
  isFeatured: true,
  salePrice: 27,
  thumbnail: NxImages.productImage36,
  categoryId: '1',
  description : 'Wiersoon Large Business Laptop Backpack- Black',
  productType: ProductType.single.toString(),
  brand: BrandModel(id: '1', image: NxImages.wiersoonBrand, name: "Wiersoon", productsCount: 321, isFeatured: true ),
  images: [NxImages.productImage36, NxImages.productImage37, NxImages.productImage38, NxImages.productImage39, NxImages.productImage40],
  productAttributes: [],
  productVariations: [],
);


final productsToUpload = [ProductModel(
id: '005',
sku: '',
title: 'What aver it may be- Black',
stock: 15,
price: 50,
isFeatured: true,
salePrice: 7,
thumbnail: NxImages.productImage50,
categoryId: '3',
description : 'What aver it may be- Black',
productType: ProductType.single.toString(),
brand: BrandModel(id: '4', image: NxImages.nikeBrand, name: "Nike", productsCount: 543, isFeatured: true ),
images: [],
productAttributes: [],
productVariations: [],
),];


final Map<String, dynamic> demoModel = {
  'Id' : '001',
  'Title' : 'Json for Demonstration',
  'Value' : 5,
  'Time' : DateTime.now(),
  'Usage' : ['Testing', 3, 33.09, DateTime.now()]
};