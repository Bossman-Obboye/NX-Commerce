import 'package:flutter/material.dart';

import '../constants/colors.dart';

class NxChipTheme {
  NxChipTheme._();

  static final NxChipTheme instance = NxChipTheme._();

  final ChipThemeData darkChipTheme = const ChipThemeData(
    disabledColor: NxColors.darkerGrey,
    labelStyle:  TextStyle(color: NxColors.white),
    selectedColor: NxColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: NxColors.white,
  );

  final ChipThemeData lightChipTheme = ChipThemeData(
    disabledColor: Colors.grey.withOpacity(0.4),
    labelStyle: const TextStyle(color: NxColors.black),
    selectedColor: NxColors.primary,
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
    checkmarkColor: NxColors.white,
  );
}