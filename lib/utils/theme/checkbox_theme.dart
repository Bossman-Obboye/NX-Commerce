import 'package:flutter/material.dart';

class NxCheckboxTheme {
  NxCheckboxTheme._();

  static final NxCheckboxTheme instance = NxCheckboxTheme._();

  // Customized Dark CheckBox Theme
  final CheckboxThemeData darkCheckboxThemeData  = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateColor.resolveWith((state){
      if(state.contains(WidgetState.selected)){
        return Colors.white;
      }else{
        return Colors.black;
      }
    }),
    fillColor: WidgetStateColor.resolveWith((state){
      if(state.contains(WidgetState.selected)){
        return Colors.blue;
      }else{
        return Colors.transparent;
      }
    }),
  );

  final CheckboxThemeData lightCheckboxThemeData  = CheckboxThemeData(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    checkColor: WidgetStateColor.resolveWith((state){
      if(state.contains(WidgetState.selected)){
        return Colors.white;
      }else{
        return Colors.black;
      }
    }),
    fillColor: WidgetStateColor.resolveWith((state){
      if(state.contains(WidgetState.selected)){
        return Colors.blue;
      }else{
        return Colors.transparent;
      }
    }),
  );
}