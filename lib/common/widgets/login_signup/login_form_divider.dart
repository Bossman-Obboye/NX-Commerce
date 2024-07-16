
import 'package:flutter/material.dart';
import '../../../utils/constants/colors.dart';

class NxFormDivider extends StatelessWidget {
  const NxFormDivider({
    super.key,
    required this.isDarkMode, required this.dividerText,
  });

  final String dividerText;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Flexible(
          child: Divider(
            color: isDarkMode ? NxColors.darkerGrey : NxColors.grey,
            thickness: 0.5,
            indent: 60,
            endIndent: 5,
          ),
        ),
        Text(
          dividerText,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Flexible(
          child: Divider(
            color: isDarkMode ? NxColors.darkerGrey : NxColors.grey,
            thickness: 0.5,
            indent: 5,
            endIndent: 60,
          ),
        )
      ],
    );
  }
}
