import 'package:flutter/material.dart';

import '../../../../../utils/constants/colors.dart';
import '../../../../../utils/helpers/helpers.dart';


class NxRatingProgressIndicator extends StatelessWidget {
  const NxRatingProgressIndicator({
    super.key, required this.text, required this.value,
  });
  final String text;
  final double value;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Text(text,
              style: Theme.of(context).textTheme.bodyMedium),
        ),
        Expanded(
          flex: 11,
          child: SizedBox(
            width: NxHelpers.screenWidth() * 0.8,
            child: LinearProgressIndicator(
              value: value,
              minHeight: 10,
              backgroundColor: NxColors.grey,
              borderRadius: BorderRadius.circular(7),
              valueColor: const AlwaysStoppedAnimation(
                NxColors.primary,
              ),
            ),
          ),
        )
      ],
    );
  }
}
