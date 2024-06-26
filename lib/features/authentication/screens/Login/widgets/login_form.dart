import 'package:computer_store/data/Token/token_model.dart';
import 'package:computer_store/features/authentication/models/loginmodel/fetch_login.dart';
import 'package:computer_store/features/authentication/screens/password_configuration/forgot_password.dart';
import 'package:computer_store/features/authentication/screens/signup/signup.dart';
import 'package:computer_store/navigation_menu.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class ULoginForm extends StatefulWidget {
  const ULoginForm({super.key});

  @override
  _ULoginFormState createState() => _ULoginFormState();
}

class _ULoginFormState extends State<ULoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  void _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      final email = emailController.text;
      final password = passwordController.text;

      AuthService authService = AuthService();
      Token? token = await authService.login(email, password);

      setState(() {
        _isLoading = false;
      });
      print(await authService.getToken());

      if (token != null) {
        // Navigate to home screen or another page
        Get.to(() => const NavigationMeun());
      } else {
        // Show error message
        Get.snackbar('Error', 'Login failed');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: USizes.spacebtwSection),
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.direct_right),
                labelText: "Email",
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },
            ),
            const SizedBox(height: USizes.spacebtwInputField),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: UTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
              obscureText: true,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            const SizedBox(height: USizes.spacebtwInputField / 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(UTexts.rememberMe)
                  ],
                ),
                TextButton(
                  onPressed: () => Get.to(() => const ForgotPassword()),
                  child: const Text(UTexts.forgotPassword),
                ),
              ],
            ),
            const SizedBox(height: USizes.spacebtwSection),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isLoading ? null : _login,
                child: _isLoading
                    ? CircularProgressIndicator()
                    : const Text(UTexts.signIn),
              ),
            ),
            const SizedBox(height: USizes.spaceBtwItem),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Get.to(() => const SignUpScreen()),
                child: const Text(UTexts.createacc),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
