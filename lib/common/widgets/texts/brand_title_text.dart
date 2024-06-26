
import 'package:computer_store/utils/constants/enums.dart';
import 'package:flutter/material.dart';

class UbrandTileText extends StatelessWidget {
  const UbrandTileText({super.key, 
  required this.title,
  this.maxlines =1, 
  this.color, 
  this.textAlign = TextAlign.center, 
  this.brandTextSize =TextSizes.small
  });

final String title;
  final int maxlines;
  final Color? color;
  final TextAlign? textAlign;
  final TextSizes brandTextSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      textAlign: textAlign ,
      maxLines: maxlines,
      overflow: TextOverflow.ellipsis,
      style: brandTextSize == TextSizes.small
      ? Theme.of(context).textTheme.labelMedium!.apply(color: color)
      : brandTextSize == TextSizes.medium
          ? Theme.of(context).textTheme.labelLarge!.apply(color: color)
          : brandTextSize == TextSizes.large
             ? Theme.of(context).textTheme.labelLarge!.apply(color: color)
             : Theme.of(context).textTheme.labelMedium!.apply(color: color),
    );
  }
}