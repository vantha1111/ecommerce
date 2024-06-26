
import 'package:computer_store/common/styles/spacing_styles.dart';
import 'package:computer_store/common/widgets/Social_button.dart';
import 'package:computer_store/common/widgets/form_divider.dart';
import 'package:computer_store/features/authentication/screens/Login/widgets/login_form.dart';
import 'package:computer_store/features/authentication/screens/Login/widgets/login_header.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: USpacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              const ULoginHeader(),

              const ULoginForm(),

              UFormDivider(dividerText: UTexts.orsignInwith.capitalize!),
              const SizedBox(height: USizes.spacebtwSection),

              const USocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}