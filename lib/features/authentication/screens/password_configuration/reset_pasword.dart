import 'package:computer_store/utils/constants/image_strings.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/constants/text_strings.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(USizes.defualtSpece),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Image
              Image(image: const AssetImage(UImages.onBoardingImage3), width: UHelper.screenWidth() * 0.6) ,       
              const SizedBox( height: USizes.spacebtwSection),

              //title
              Text(UTexts.changePassword, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox( height: USizes.spaceBtwItem),
              Text('support@gmail.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox( height: USizes.spaceBtwItem),
              Text(UTexts.changePasswordSubtitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox( height: USizes.spacebtwSection),

              //button
              SizedBox( width: double.infinity, child: ElevatedButton(onPressed: (){},child: const Text(UTexts.done))),

              SizedBox( width: double.infinity, child: ElevatedButton(onPressed: (){},child: const Text(UTexts.resendEmail))),
          ],
        ),
        ),
    );
  }
}