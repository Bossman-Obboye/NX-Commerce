import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'data/repositories/auth_repo/auth_repository.dart';
import 'features/shop/models/brand_model.dart';
import 'firebase_options.dart';
import 'nx_app.dart';

Future<void> main() async {
  /// -- Widget Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  /// -- Initialized GetX Local Storage
  await GetStorage.init();

  /// -- Await Splash until other items Load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  runApp(const NXApp());
}

final brand1 = BrandModel(
  id: '001',
  image:
      'https://firebasestorage.googleapis.com/v0/b/nxcommerce-9d467.appspot.com/o/Brands%2FImages%2FOpenCabinet?alt=media&token=702529de-45b4-4880-9993-9a6dee966486',
  name: "OpenCabinet",
  productsCount: 63,
  isFeatured: true,
);
final brand2 = BrandModel(
  id: '002',
  image:
      'https://firebasestorage.googleapis.com/v0/b/nxcommerce-9d467.appspot.com/o/Brands%2FImages%2FHF?alt=media&token=b70e3760-2f49-4392-908d-180aad606388',
  name: "HF",
  productsCount: 141,
  isFeatured: true,
);

final brand3 = BrandModel(
  id: '003',
  image:
      'https://firebasestorage.googleapis.com/v0/b/nxcommerce-9d467.appspot.com/o/Brands%2FImages%2FNike?alt=media&token=fe68055d-f023-4be5-b158-de11d7e31b7f',
  name: "Nike",
  productsCount: 648,
  isFeatured: true,
);

final brand4 = BrandModel(
    id: '004',
    image:
        'https://firebasestorage.googleapis.com/v0/b/nxcommerce-9d467.appspot.com/o/Brands%2FImages%2FSony?alt=media&token=f3334c55-74c8-44c3-9ae3-907867f36576',
    name: "Sony",
    productsCount: 520,
    isFeatured: true);
