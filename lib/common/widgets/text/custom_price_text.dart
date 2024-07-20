
import 'package:flutter/material.dart';

class NxProductPriceText extends StatelessWidget {
  const NxProductPriceText({
    required this.price,
    this.isLarge = false,
    super.key,
    this.currencySign = "\$",
    this.maxLines = 1,
    this.lineThrough = false,
  });

  final String price, currencySign;
  final bool isLarge;
  final int maxLines;
  final bool lineThrough;
  @override
  Widget build(BuildContext context) {
    return Text(currencySign + price,
        style: isLarge
            ? Theme.of(context).textTheme.headlineMedium!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null)
            : Theme.of(context).textTheme.titleLarge!.apply(
                decoration: lineThrough ? TextDecoration.lineThrough : null));
  }
}
