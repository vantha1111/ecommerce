
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/constants/text_strings.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UTermCheckBox extends StatelessWidget {
  const UTermCheckBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = UHelper.isDarkMode(context);
    return Row(
      children: [
        SizedBox(width: 24, height:24, child: Checkbox(value: true, onChanged: (value){})),
        const SizedBox( height: USizes.spaceBtwItem),
        Text.rich(TextSpan(
          children: [
            TextSpan(text: '${UTexts.iagreeto} ', style: Theme.of(context).textTheme.bodySmall),
            TextSpan(text: '${UTexts.privacyPolicy} ', style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: dark ? UColors.white : UColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: dark ? UColors.white : UColors.primary,
            )),
            TextSpan(text: '${UTexts.and} ', style: Theme.of(context).textTheme.bodySmall),
            TextSpan(text: UTexts.termOfUse, style: Theme.of(context).textTheme.bodyMedium!.apply(
              color: dark ? UColors.white : UColors.primary,
              decoration: TextDecoration.underline,
              decorationColor: dark ? UColors.white : UColors.primary,
            )),
          ]),
        ),
      ],
    );
  }
}