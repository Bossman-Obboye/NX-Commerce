import 'package:flutter/material.dart';

import '../constants/colors.dart';

class NxCircularLoader extends StatelessWidget {
  const NxCircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 50,
        decoration: const BoxDecoration(
        color: NxColors.primary,
          shape: BoxShape.circle,
        ),
        padding: const EdgeInsets.all(15.0),
        child: const CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 6,
        ),
      ),
    );
  }
}
