import 'package:computer_store/common/widgets/succress_screen/success_screen.dart';
import 'package:computer_store/common/widgets/succress_screen/verify_code_form.dart';
import 'package:computer_store/features/authentication/screens/Login/login.dart';
import 'package:computer_store/utils/constants/image_strings.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/constants/text_strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () => Get.offAll(() => const LoginScreen()),
              icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defualtSpece),
          child: Column(
            children: [
              //title
              Text(UTexts.confirmEmail,
                  style: Theme.of(context).textTheme.headlineMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: USizes.spaceBtwItem),
              Text('support@gmail.com',
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: USizes.spaceBtwItem),
              Text(UTexts.confirmEmailSubtitle,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center),
              const SizedBox(height: USizes.spacebtwSection),

               const VerifyCodeForm(),
              const SizedBox(height: USizes.spacebtwSection),

              //button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => Get.to(
                          () => SuccessScreen(
                            image: UImages.onBoardingImage2,
                            title: UTexts.confirmAcc,
                            subtile: UTexts.confirmAccSubtile,
                            onPressed: () => Get.to(() => const LoginScreen()),
                          ),
                        ),
                    child: const Text(UTexts.continus)),
              ),
              const SizedBox(height: USizes.spaceBtwItem),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {}, child: const Text(UTexts.resendEmail))),
            ],
          ),
        ),
      ),
    );
  }
}
