
import 'package:computer_store/features/authentication/controllers/onboarding_controller.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/device/device_utility.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class OnboradingNextButton extends StatelessWidget {
  const OnboradingNextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final dark = UHelper.isDarkMode(context);
    return Positioned(
      right: USizes.defualtSpece,
      bottom: UDeviceUtils.getBottonNavigationbarheight(),
      child: ElevatedButton(
        onPressed: () => OnBoardingController.instance.nextPage(),
        style: ElevatedButton.styleFrom(shape: const CircleBorder(), backgroundColor: dark ? UColors.primary : Colors.black),
        child: const Icon(Iconsax.arrow_right_3),
      ),
    );
  }
}