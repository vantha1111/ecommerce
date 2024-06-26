import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/text_strings.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UFormDivider extends StatelessWidget {
  const UFormDivider({super.key, required this.dividerText});

  final String dividerText;

  @override
  Widget build(BuildContext context) {
    final dark = UHelper.isDarkMode(context);
    return Row(   
                mainAxisAlignment: MainAxisAlignment.center,           
                children: [
                  Flexible(child: Divider(color: dark ? UColors.darGrey: UColors.grey, thickness: 0.5, indent: 60, endIndent: 5)),
                  Text(UTexts.orsignInwith.capitalize!, style: Theme.of(context).textTheme.labelMedium),
                  Flexible(child: Divider(color: dark ? UColors.darGrey: UColors.grey, thickness: 0.5, indent: 5, endIndent: 60)),
                ],
              );
  }
}