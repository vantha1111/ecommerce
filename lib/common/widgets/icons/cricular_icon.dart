import 'package:flutter/material.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';

class UCricularIcon extends StatelessWidget {
  const UCricularIcon({
    Key? key,
    this.width,
    this.height,
    this.size = USizes.lg,
    required this.icon,
    this.color,
    this.backgroundColor,
    this.onTap,
  }) : super(key: key);

  final double? width, height, size;
  final IconData icon;
  final Color? color;
  final Color? backgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor ??
              (UHelper.isDarkMode(context)
                  ? UColors.black.withOpacity(0.9)
                  : UColors.white.withOpacity(0.9)),
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(icon, color: color, size: size),
      ),
    );
  }
}
