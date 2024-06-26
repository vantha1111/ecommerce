
import 'package:computer_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UCouponCode extends StatelessWidget {
  const UCouponCode({
    super.key,
    
  });

  

  @override
  Widget build(BuildContext context) {
    final dark = UHelper.isDarkMode(context);
    return URoundedContainer(
      showBorder: true,
      backgroundColor: dark ? UColors.dark : UColors.white,
      padding: const EdgeInsets.only(top: USizes.sm, bottom: USizes.sm, right: USizes.sm, left: USizes.md),
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'Have promo code? enter here',
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
              ) ,
            ),
          ),
          //button
          SizedBox(
            width: 80,
            child: ElevatedButton(
              onPressed: (){}, 
              style: ElevatedButton.styleFrom(
                foregroundColor: dark ? UColors.white.withOpacity(0.5) : UColors.dark.withOpacity(0.5),
                backgroundColor: Colors.grey.withOpacity(0.2),
                side: BorderSide(color: Colors.grey.withOpacity(0.1)),
              ),
              child: const Text('Apply')
            ),
          ),
        ],
      ),
    );
  }
}