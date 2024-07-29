import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data/repositories/auth_repo/auth_repository.dart';
import 'firebase_options.dart';
import 'nx_app.dart';

Future<void> main() async {


  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
  //     (Firebase value) => Get.put(AuthRepository()),
  // );

  runApp(const NXApp());
}



