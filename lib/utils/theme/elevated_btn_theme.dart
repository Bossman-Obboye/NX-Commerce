import 'package:flutter/material.dart';

class NxElevatedBtnTheme {
  NxElevatedBtnTheme._();

  static final NxElevatedBtnTheme instance = NxElevatedBtnTheme._();

  final ElevatedButtonThemeData darkElevatedBtnTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      foregroundColor: Colors.white,
      backgroundColor: Colors.blue,
   disabledBackgroundColor: Colors.grey,
      disabledForegroundColor: Colors.grey,
      side: const BorderSide(color: Colors.blue),
      padding: const EdgeInsets.symmetric(vertical: 10),
      textStyle: const TextStyle(fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  );

  final ElevatedButtonThemeData lightElevatedBtnTheme =
  ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue,
        disabledBackgroundColor: Colors.grey,
        disabledForegroundColor: Colors.grey,
        side: const BorderSide(color: Colors.blue),
        padding: const EdgeInsets.symmetric(vertical: 10),
        textStyle: const TextStyle(
            fontSize: 16, color: Colors.white, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ));

}
