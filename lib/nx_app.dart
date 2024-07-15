import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'features/authentication/screens/onboarding_screen.dart';
import 'utils/theme/theme_data.dart';

class NXApp extends StatelessWidget {
  const NXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      themeMode: ThemeMode.system,
      theme: NXAppTheme.instance.lightTheme,
      darkTheme:  NXAppTheme.instance.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}
