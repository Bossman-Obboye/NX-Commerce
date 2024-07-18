
import 'package:flutter/material.dart';

class NxSectionHeading extends StatelessWidget {
  NxSectionHeading({
    super.key,
    this.textColor,
    this.showActionButton = true,
    required this.title,
    this.btnText = '',
    this.btnOnPressed,
    
  }) : 
  /// Assert by expectation. That is, I am expecting the  [showActionButton]
  /// to be true and the [btnText] not to be empty or  I am expecting the 
  /// [showActionButton] to be [false] and the [btnOnPressed] to be empty.
  assert((showActionButton && btnText.isNotEmpty) || (!showActionButton && btnText.isEmpty) ,
            "Content of button must be provider");

  final Color? textColor;
  final bool showActionButton;
  final String title, btnText;
  final void Function()? btnOnPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
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
          TextButton(onPressed: btnOnPressed, child: Text(btnText)),
      ],
    );
  }
}

