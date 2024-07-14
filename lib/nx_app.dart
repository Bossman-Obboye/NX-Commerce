import 'package:flutter/material.dart';

import 'utils/theme/theme_data.dart';

class NXApp extends StatelessWidget {
  const NXApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      themeMode: ThemeMode.system,
      theme: NXAppTheme.instance.lightTheme,
      darkTheme:  NXAppTheme.instance.darkTheme,
    );
  }
}
