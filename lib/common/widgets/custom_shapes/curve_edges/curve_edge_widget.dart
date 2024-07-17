import 'package:flutter/material.dart';

import 'curved_edges.dart';

class NxCurvedEdgeWidget extends StatelessWidget {
  const NxCurvedEdgeWidget({
    super.key, this.child,
  });
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: NxCustomCurvedEdges(),
        child: child
    );
  }
}