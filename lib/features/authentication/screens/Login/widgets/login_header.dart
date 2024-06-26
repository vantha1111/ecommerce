import 'package:computer_store/utils/constants/image_strings.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/constants/text_strings.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ULoginHeader extends StatelessWidget {
  const ULoginHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelper.isDarkMode(context);
    return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image(
                    height: 150,
                    image: AssetImage(dark? UImages.lightAppLogo : UImages.lightAppLogo),
                  ),
                  Text(UTexts.onboardingTittle1, style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox( height: USizes.sm),
                  Text(UTexts.onboardingTittle1, style: Theme.of(context).textTheme.bodyMedium),
                ],
              );
  }
}