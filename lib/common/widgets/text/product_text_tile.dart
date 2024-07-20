import 'package:flutter/material.dart';

class NxProductTitleText extends StatelessWidget {
  const NxProductTitleText({
    super.key,
    required this.title,
    this.isSmallSize = false,
    this.maxLines = 2,
    // this.textAlign = TextAlign.left,
  });

  final String title;
  final bool isSmallSize;
  final int maxLines;
  // final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: isSmallSize
          ? Theme.of(context).textTheme.labelLarge
          : Theme.of(context).textTheme.titleSmall,
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      // textAlign: textAlign,
    );
  }
}
