import 'package:flutter/material.dart';
import 'package:nx_commerce/utils/constants/colors.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';

class NxSectionHeading extends StatelessWidget {
  const NxSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.btnText = '',
    this.btnOnPressed,
  });
  final Color? textColor;
  final bool showActionButton;
  final String title, btnText;
  final void Function()? btnOnPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall!.apply(
                color: textColor,
              ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(
              onPressed: btnOnPressed,
              child: Text(btnText,
                  style: TextStyle(
                      color: NxHelpers.isDarkMode(context)
                          ? NxColors.darkGrey
                          : null))),
      ],
    );
  }
}
