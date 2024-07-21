import 'package:flutter/material.dart';
import 'package:nx_commerce/utils/constants/colors.dart';

class NxShadowStyle {

  static final verticalProductShadow = BoxShadow(
      color: NxColors.darkerGrey.withOpacity(0.1),
      blurRadius : 50,
      spreadRadius: 7,
    offset:  const Offset(0,2),
  );


  static final horizontalProductShadow = BoxShadow(
    color: NxColors.darkerGrey.withOpacity(0.1),
    blurRadius : 50,
    spreadRadius: 7,
    offset:  const Offset(0,2),
  );

}


