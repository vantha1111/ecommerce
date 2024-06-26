import 'package:computer_store/features/authentication/models/signupmodel/fetch_signin.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:computer_store/data/services/authentication/register.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/constants/text_strings.dart';
import 'package:computer_store/features/authentication/screens/signup/verify_email.dart';
import 'package:computer_store/features/authentication/screens/signup/widgets/term_chechbox.dart'; // Import submitData function

class USignUpForm extends StatefulWidget {
  const USignUpForm({Key? key}) : super(key: key);

  @override
  _USignUpFormState createState() => _USignUpFormState();
}

class _USignUpFormState extends State<USignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  controller: _firstnameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: UTexts.firstName,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(width: USizes.spacebtwInputField),
              Expanded(
                child: TextFormField(
                  controller: _lastnameController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.user),
                    labelText: UTexts.lastName,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: USizes.spacebtwInputField),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.direct),
              labelText: UTexts.email,
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
            controller: _passwordController,
            obscureText: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              labelText: UTexts.password,
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          const SizedBox(height: USizes.spacebtwInputField),
          TextFormField(
            controller: _confirmPasswordController,
            obscureText: true,
            decoration: const InputDecoration(
              prefixIcon: Icon(Iconsax.password_check),
              labelText: UTexts.confirmpass,
              suffixIcon: Icon(Iconsax.eye_slash),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please confirm your password';
              }
              if (value != _passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
          const SizedBox(height: USizes.spacebtwSection),
          const UTermCheckBox(),
          const SizedBox(height: USizes.spacebtwSection),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Register registerData = Register(
                    firstname: _firstnameController.text,
                    lastname: _lastnameController.text,
                    email: _emailController.text,
                    password: _passwordController.text,
                    confirmPassword: _confirmPasswordController.text,
                  );
                  submitData(registerData);
                  Get.to(() => const VerifyEmailScreen());
                }
              },
              child: const Text(UTexts.createacc),
            ),
          ),
        ],
      ),
    );
  }
}
