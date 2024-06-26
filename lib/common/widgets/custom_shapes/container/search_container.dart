import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/device/device_utility.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class USearchContainer extends StatelessWidget {
  const USearchContainer({
    super.key,
    required this.hintText,
    this.icon = Iconsax.search_normal,
    this.showBackground = true,
    this.showBorder = true,
    this.onChanged,
    this.onTap,
    this.padding = const EdgeInsets.symmetric(horizontal: USizes.defualtSpece),
  });

  final String hintText;
  final IconData? icon;
  final bool showBackground, showBorder;
  final VoidCallback? onTap;
  final ValueChanged<String>? onChanged;
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    final dark = UHelper.isDarkMode(context);

    return Padding(
      padding: padding,
      child: Container(
        width: UDeviceUtils.getScreenWidth(context),
        padding: const EdgeInsets.all(USizes.md),
        decoration: BoxDecoration(
          color: showBackground ? dark ? UColors.dark : UColors.light : Colors.transparent,
          borderRadius: BorderRadius.circular(USizes.cardRaduieLg),
          border: showBorder ? Border.all(color: UColors.grey) : null,
        ),
        child: TextField(
          onTap: onTap,
          onChanged: onChanged,
          decoration: InputDecoration(
            icon: Icon(icon, color: UColors.darkerGrey),
            hintText: hintText,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
