
import 'package:computer_store/features/authentication/screens/password_configuration/reset_pasword.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(USizes.defualtSpece),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //heading
            Text(UTexts.forgotPassword, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox( height: USizes.spaceBtwItem),
            Text(UTexts.forgotPasswordSubtitle, style: Theme.of(context).textTheme.labelMedium),
            const SizedBox( height: USizes.spacebtwSection * 2),

            //textfeild
            TextFormField(
              decoration:const InputDecoration(labelText: UTexts.email, prefixIcon: Icon(Iconsax.direct_right)) ,
            ),
            const SizedBox( height: USizes.spacebtwSection),
            
            //submit button
            SizedBox(width: double.infinity, child:  ElevatedButton(onPressed: () => Get.off(() => const ResetPassword()) ,child: const Text(UTexts.submit))),
            const SizedBox(height: USizes.spaceBtwItem),
          ],
        ),
        ),
    );
  }
}