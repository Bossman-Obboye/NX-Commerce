import 'package:flutter/material.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/constants/sizes.dart';

class NxTextFormFieldTheme {
  NxTextFormFieldTheme._();

  static final NxTextFormFieldTheme instance = NxTextFormFieldTheme._();

  final InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: NxColors.darkerGrey,
    suffixIconColor: NxColors.darkerGrey,
    // constraints: const BoxConstraints.expand(height: NxSizes.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: NxSizes.fontSizeMd, color: NxColors.black),
    hintStyle: const TextStyle().copyWith(fontSize: NxSizes.fontSizeMd, color: NxColors.black),
    errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    // floatingLabelBehavior: FloatingLabelBehavior.never,
    floatingLabelStyle: const TextStyle().copyWith(color: NxColors.black.withOpacity(0.8)),
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(NxSizes.inputFieldRadius),
        borderSide: const BorderSide(width: 1, color: NxColors.grey)
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(NxSizes.inputFieldRadius),
        borderSide: const BorderSide(width: 1, color: NxColors.grey)
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(NxSizes.inputFieldRadius),
        borderSide: const BorderSide(width: 1, color: NxColors.dark)
    ),
    errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(NxSizes.inputFieldRadius),
        borderSide: const BorderSide(width: 1, color: NxColors.warning)
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(NxSizes.inputFieldRadius),
        borderSide: const BorderSide(width: 2, color: NxColors.warning)
    ),
  );


  final InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    errorMaxLines: 3,
    prefixIconColor: NxColors.darkerGrey,
    suffixIconColor: NxColors.darkerGrey,
    // constraints: const BoxConstraints.expand(height: 14.inputFieldHeight),
    labelStyle: const TextStyle().copyWith(fontSize: NxSizes.fontSizeMd, color: NxColors.white),
    hintStyle: const TextStyle().copyWith(fontSize: NxSizes.fontSizeMd, color: NxColors.white),
    floatingLabelStyle: const TextStyle().copyWith(color: NxColors.white.withOpacity(0.8)),
    // errorStyle: const TextStyle().copyWith(fontStyle: FontStyle.normal),
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(NxSizes.inputFieldRadius),
        borderSide: const BorderSide(width: 1, color: NxColors.darkerGrey)
    ),
    enabledBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(NxSizes.inputFieldRadius),
        borderSide: const BorderSide(width: 1, color: NxColors.darkerGrey)
    ),
    focusedBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(NxSizes.inputFieldRadius),
        borderSide: const BorderSide(width: 1, color: NxColors.white)
    ),
    errorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(NxSizes.inputFieldRadius),
        borderSide: const BorderSide(width: 1, color: NxColors.warning)
    ),
    focusedErrorBorder: const OutlineInputBorder().copyWith(
        borderRadius: BorderRadius.circular(NxSizes.inputFieldRadius),
        borderSide: const BorderSide(width: 2, color: NxColors.warning)
    ),
  );

}