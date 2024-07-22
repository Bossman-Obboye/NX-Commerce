import 'package:flutter/material.dart';
import 'package:nx_commerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:nx_commerce/utils/helpers/helpers.dart';

import '../../../utils/constants/colors.dart';

class NxChoiceChip extends StatelessWidget {
  const NxChoiceChip({
    super.key,
    required this.text,
    required this.selected,
    this.onSelected,
  });

  final String text;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    final Color? getColor = NxHelpers.getColor(text);
    final bool isColor = (getColor != null);
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: ChoiceChip(
        label: isColor ? const SizedBox() : Text(text),
        selected: selected,
        onSelected: onSelected,
        labelStyle: TextStyle(color: selected ? NxColors.white : null),
        avatar: isColor
            ?  NxRoundedContainer(
                width: 50,
                height: 50,
                backgroundColor: getColor,
              )
            : null,

        labelPadding: isColor ? EdgeInsets.zero : null,
        // make icon in the center
        padding:  isColor ? EdgeInsets.zero : null,
        shape: isColor ? const CircleBorder() : null,
        backgroundColor: isColor ? getColor : null,
      ),
    );
  }
}
