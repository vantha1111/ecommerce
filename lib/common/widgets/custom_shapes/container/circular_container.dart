
import 'package:computer_store/utils/constants/color.dart';
import 'package:flutter/material.dart';

class UCircularContainer extends StatelessWidget {
  const UCircularContainer({
    super.key, 
    this.width = 400, 
    this.height = 400, 
    this.redius = 400, 
    this.padding = 0, 
    this.child, 
    this.backgroundColor = UColors.white, 
    this.margin,
  });

  final double? width;
  final double? height;
  final double redius;
  final EdgeInsets? margin;
  final double padding;
  final Widget? child;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(redius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}