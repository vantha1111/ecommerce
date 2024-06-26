import 'package:computer_store/common/widgets/icons/cricular_icon.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UButtonAddtoCart extends StatelessWidget {
  const UButtonAddtoCart({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelper.isDarkMode(context);
    return Container(
       padding: const EdgeInsets.symmetric(horizontal: USizes.defualtSpece, vertical: USizes.defualtSpece / 2),
        decoration: BoxDecoration(
          color: dark ? UColors.darGrey : UColors.light,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(USizes.cardRaduieLg),
            topRight: Radius.circular(USizes.cardRaduieLg),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                const UCricularIcon(
                  icon: Iconsax.minus,
                  backgroundColor: UColors.darGrey,
                  width: 40,
                  height: 40, 
                  color: UColors.white,
                ),
                const SizedBox(width: USizes.spaceBtwItem),
                Text('2', style: Theme.of(context).textTheme.titleSmall),
                const SizedBox(width: USizes.spaceBtwItem),
                const UCricularIcon(
                  icon: Iconsax.add,
                  backgroundColor: UColors.black,
                  width: 40,
                  height: 40, 
                  color: UColors.white,
                ),
              ],
            ),
            ElevatedButton(
              onPressed: (){}, 
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(USizes.md),
                backgroundColor: UColors.black,
                side: const BorderSide(color: UColors.black),
              ),
              child: const Text('Add to Cart'),
            )
          ],
        ),
    );
  }
}