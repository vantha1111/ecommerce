import 'package:computer_store/common/styles/spacing_styles.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/constants/text_strings.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';


class SuccessScreen extends StatelessWidget {
  const SuccessScreen(
      {super.key,
      required this.image,
      required this.title,
      required this.subtile,
      required this.onPressed});

  final String image, title, subtile;
  final VoidCallback onPressed;


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: USpacingStyle.paddingWithAppBarHeight * 2,
          child: Column(
            children: [

              //Image
              Image(image: AssetImage(image), width: UHelper.screenWidth() * 0.6) ,
              const SizedBox( height: USizes.spacebtwSection),

              //title
              Text(title, style: Theme.of(context).textTheme.headlineMedium, textAlign: TextAlign.center),
              const SizedBox( height: USizes.spaceBtwItem),
              Text('support@gmail.com', style: Theme.of(context).textTheme.labelLarge, textAlign: TextAlign.center),
              const SizedBox( height: USizes.spaceBtwItem),
              Text(subtile, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center),
              const SizedBox( height: USizes.spacebtwSection),

              //button
              SizedBox( width: double.infinity, child: ElevatedButton(onPressed: onPressed,child: const Text(UTexts.continus))),
            ]),
        ),
      ),
    );
  }
} 