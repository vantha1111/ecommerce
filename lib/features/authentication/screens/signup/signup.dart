import 'package:computer_store/common/widgets/Social_button.dart';
import 'package:computer_store/common/widgets/form_divider.dart';
import 'package:computer_store/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/constants/text_strings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defualtSpece),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(UTexts.signupTitle, style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: USizes.spacebtwSection),
              // Form
              const USignUpForm(),
              const SizedBox(height: USizes.spacebtwSection),
              // Divider
              UFormDivider(dividerText: UTexts.orsignInwith.capitalize!),
              const SizedBox(height: USizes.spacebtwSection),
              // Social button
              const USocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}
