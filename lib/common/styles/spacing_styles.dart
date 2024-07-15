import 'package:flutter/cupertino.dart';

import '../../utils/constants/sizes.dart';

class NxSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: NxSizes.appBarHeight,
    left: NxSizes.defaultSpace,
    right: NxSizes.defaultSpace,
    bottom: NxSizes.defaultSpace,
  );
}