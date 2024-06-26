import 'package:computer_store/common/widgets/texts/brand_title_text.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/enums.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UBrandtitlewithverifiedIcon extends StatelessWidget {
  const UBrandtitlewithverifiedIcon({
    super.key, 
    required this.title, 
    this.maxlines = 1, 
    this.textColor, 
    this.iconColor = UColors.primary, 
    this.textAlign = TextAlign.center, 
    this.brandTextSize = TextSizes.small,
  });

  final String title;
  final int maxlines;
  final Color? textColor, iconColor;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: UbrandTileText(
            title: title,
            color: textColor ,
            maxlines: maxlines,
            textAlign: textAlign,
            brandTextSize: brandTextSize,
          )
          ),
        const SizedBox(width: USizes.xs),
        Icon(Iconsax.verify5, color: iconColor, size: USizes.iconXs)
      ],
    );
  }
}