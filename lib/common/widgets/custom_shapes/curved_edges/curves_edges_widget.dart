
import 'package:computer_store/common/widgets/custom_shapes/curved_edges/curved_edges.dart';
import 'package:flutter/material.dart';

class UCurvedEdgesWidget extends StatelessWidget {
  const UCurvedEdgesWidget({
    super.key, 
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: UCustomCircularEdges(),
      child: child,
    );
  }
}