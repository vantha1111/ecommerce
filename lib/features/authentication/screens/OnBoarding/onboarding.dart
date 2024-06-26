
import 'package:computer_store/features/authentication/controllers/onboarding_controller.dart';
import 'package:computer_store/features/authentication/screens/OnBoarding/widget/onborading_next_button.dart';
import 'package:computer_store/features/authentication/screens/OnBoarding/widget/onborading_skip.dart';
import 'package:computer_store/utils/constants/image_strings.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/constants/text_strings.dart';

import 'package:computer_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoradingPage(
                image: UImages.onBoardingImage1, 
                title: UTexts.onboardingTittle1, 
                subTitle: UTexts.onboardingSubTittle1,
              ),
              OnBoradingPage(
                image: UImages.onBoardingImage2, 
                title: UTexts.onboardingTittle2, 
                subTitle: UTexts.onboardingSubTittle2,
              ),
              OnBoradingPage(
                image: UImages.onBoardingImage3, 
                title: UTexts.onboardingTittle3, 
                subTitle: UTexts.onboardingSubTittle3,
              ),
            ],
          ),
          const OnBoardingSkip(),

          const OnboradingNextButton(),
        ],
      ),
    );
  }
}


class OnBoradingPage extends StatelessWidget {
  const OnBoradingPage({
    super.key, required this.image, required this.title, required this.subTitle,
  });

  final String image, title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(USizes.defualtSpece),
      child: Column(
        children: [
          Image(
            width: UHelper.screenWidth() * 0.8,
            height: UHelper.screenHeight() * 0.6,
            image: AssetImage(image),
          ),
          Text(
            title, 
            style: Theme.of(context).textTheme.headlineMedium, 
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: USizes.spaceBtwItem),
          Text(
            subTitle, 
            style: Theme.of(context).textTheme.bodyMedium, 
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}

