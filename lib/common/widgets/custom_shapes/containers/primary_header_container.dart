import 'package:flutter/material.dart';
import '../../../../utils/constants/colors.dart';
import '../curve_edges/curve_edge_widget.dart';
import 'rounded_container.dart';


class NxPrimaryHeaderContainer extends StatelessWidget {
  const NxPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return NxCurvedEdgeWidget(
      child: Container(
        color: NxColors.primary,
        padding: const EdgeInsets.all(0),
        child: SizedBox(
          height: 400,
          child: Stack(
            children: [
              /// Background Custom Shapes
              Positioned(
                  top: -150,
                  right: -250,
                  child: NxRoundedContainer(
                      backgroundColor: NxColors.textWhite.withOpacity(0.1))),
              Positioned(
                  top: 100,
                  right: -300,
                  child: NxRoundedContainer(
                      backgroundColor: NxColors.textWhite.withOpacity(0.1))),
              child
            ],
          ),
        ),
      ),
    );
  }
}
