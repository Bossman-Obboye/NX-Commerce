import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nx_commerce/bindings/general_bindings.dart';
import 'package:nx_commerce/routes/app_routes.dart';
import 'package:nx_commerce/utils/constants/colors.dart';

import 'utils/theme/theme_data.dart';

class NXApp extends StatelessWidget {
  const NXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: NXAppTheme.instance.lightTheme,
      darkTheme:  NXAppTheme.instance.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: NxAppRoutes.pages,
      /// -- Show Loader or Circular Progress Indicator meanwhile Authentication Repository is deciding
      /// to show relevant screen. 
      home: const Scaffold(backgroundColor: NxColors.primary, body: Center(child: CircularProgressIndicator(color: Colors.white))),
    );
  }
}
