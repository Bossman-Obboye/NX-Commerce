import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';
import 'nx_app.dart';

Future<void> main() async {


  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
  //     (Firebase value) => Get.put(AuthenticationRepository()),
  // );

  runApp(const NXApp());
}



