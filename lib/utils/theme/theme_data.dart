import 'package:flutter/material.dart';
import 'package:nx_commerce/utils/theme/appbar_theme.dart';
import 'package:nx_commerce/utils/theme/bottom_sheet_theme.dart';
import 'package:nx_commerce/utils/theme/checkbox_theme.dart';
import 'package:nx_commerce/utils/theme/chip_theme.dart';
import 'package:nx_commerce/utils/theme/elevated_btn_theme.dart';
import 'package:nx_commerce/utils/theme/outlined_btn_theme.dart';
import 'package:nx_commerce/utils/theme/text_field_theme.dart';
import 'package:nx_commerce/utils/theme/text_theme.dart';

class NXAppTheme{
  NXAppTheme._();

  static final NXAppTheme instance = NXAppTheme._();

  final ThemeData darkTheme = ThemeData(
    fontFamily: "LexendDeca",
    useMaterial3 : true,
    brightness: Brightness.dark,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor:  Colors.black,
    textTheme:  NxTextTheme.instance.darkTextTheme,
    elevatedButtonTheme: NxElevatedBtnTheme.instance.darkElevatedBtnTheme,
    appBarTheme: NxAppBarTheme.instance.darkAppBarTheme,
    bottomSheetTheme: NxBottomSheetTheme.instance.darkBottomSheetTheme,
    checkboxTheme: NxCheckboxTheme.instance.darkCheckboxThemeData,
    chipTheme: NxChipTheme.instance.darkChipTheme,
    outlinedButtonTheme: NxOutlinedBtnTheme.instance.darkOutlinedButtonTheme,
    inputDecorationTheme: NxTextFormFieldTheme.instance.darkInputDecorationTheme,
  );


  final ThemeData lightTheme = ThemeData(
    fontFamily: "LexendDeca",
    useMaterial3 : true,
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor:  Colors.white,
    textTheme:  NxTextTheme.instance.lightTextTheme,
    elevatedButtonTheme: NxElevatedBtnTheme.instance.lightElevatedBtnTheme,
    appBarTheme: NxAppBarTheme.instance.lightAppBarTheme,
    bottomSheetTheme: NxBottomSheetTheme.instance.lightBottomSheetTheme,
    checkboxTheme: NxCheckboxTheme.instance.lightCheckboxThemeData,
    chipTheme: NxChipTheme.instance.lightChipTheme,
    outlinedButtonTheme: NxOutlinedBtnTheme.instance.lightOutlinedButtonTheme,
    inputDecorationTheme: NxTextFormFieldTheme.instance.lightInputDecorationTheme,
  );
}
