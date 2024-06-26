
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class URoundedContainer extends StatelessWidget {
  const URoundedContainer({super.key, 
  this.width, 
  this.height, 
  this.redius = USizes.cardRaduieLg, 
  this.child, 
  this.showBorder = false, 
  this.backgroundColor = UColors.white, 
  this.broderColor = UColors.borderPrimary, 
  this.padding, 
  this.margin});

  final double? width;
  final double? height;
  final double redius;
  final Widget? child;
  final bool showBorder;
  final Color backgroundColor;
  final Color broderColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      margin: margin,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(redius),
        border: showBorder ? Border.all(color:  broderColor) : null
      ),
      child: child,
    );
  }

}