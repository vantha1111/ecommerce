import 'package:computer_store/common/widgets/custom_shapes/container/circular_container.dart';
import 'package:computer_store/common/widgets/custom_shapes/curved_edges/curves_edges_widget.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:flutter/material.dart';

class UPrimaryHeaderContainer extends StatelessWidget {
  const UPrimaryHeaderContainer({
    super.key, required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return UCurvedEdgesWidget(
      child: Container(
        color: UColors.primary,

          child: Stack(
             children: [
               Positioned(top: -150, right: -250 , child: UCircularContainer(backgroundColor: UColors.textaccent.withOpacity(0.1))),
               Positioned(top: -100, right: -300,  child: UCircularContainer(backgroundColor: UColors.textaccent.withOpacity(0.1))),
            child,  
            ], 
          ),
      ),
    );
  }
}