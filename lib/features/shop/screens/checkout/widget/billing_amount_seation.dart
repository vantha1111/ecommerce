import 'package:computer_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:computer_store/common/widgets/texts/section_heading.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/image_strings.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UBillngAmountSection extends StatelessWidget {
  const UBillngAmountSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        USectionHeading(title: 'Payment', buttonTitle: 'Change',onPressed: (){}),
        const SizedBox(height: USizes.spaceBtwItem / 2),

        Row(
          children: [
            URoundedContainer(
              width:  60,
              height: 35 ,
              backgroundColor: UHelper.isDarkMode(context) ? UColors.light : UColors.white,
              padding: const EdgeInsets.all(USizes.md),
              child: const Image(image: AssetImage(UImages.appLogo), fit: BoxFit.contain,),
            ),
            const SizedBox(height: USizes.spaceBtwItem / 2),
            Text('ABA',style: Theme.of(context).textTheme.bodyLarge,),
            
          ],
        )
      ],
    );
  }
}