
import 'package:computer_store/utils/constants/color.dart';
import 'package:flutter/material.dart';

class UShadowStyle {
  static final verticalProductShadow = BoxShadow(
    color: UColors.darkerGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );

  
  static final horizontalProductShadow = BoxShadow(
    color: UColors.darkerGrey.withOpacity(0.1),
    blurRadius: 50,
    spreadRadius: 7,
    offset: const Offset(0, 2)
  );
}