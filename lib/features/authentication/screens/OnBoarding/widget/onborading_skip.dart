import 'package:computer_store/features/authentication/controllers/onboarding_controller.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/device/device_utility.dart';
import 'package:flutter/material.dart';

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: UDeviceUtils.getAppBarHeight(),
      right: USizes.defualtSpece,
      child: TextButton(onPressed: () => OnBoardingController.instance.skipPage(), child: const Text('Skip'))
    );
  }
}