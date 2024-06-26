
import 'package:computer_store/common/widgets/icons/cricular_icon.dart';
import 'package:computer_store/features/shop/models/cart/cart_model.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UProductwithAddRemove extends StatelessWidget {
  const UProductwithAddRemove({
    super.key,required this.cartItem, 
  });

  final CartItem cartItem;


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        UCricularIcon(
          icon: Iconsax.minus,
          width: 32,
          height: 32,
          size: USizes.md,
          color: UHelper.isDarkMode(context) ? UColors.white : UColors.black,
          backgroundColor: UHelper.isDarkMode(context) ? UColors.darGrey : UColors.light,
        ),
        const SizedBox(width: USizes.spaceBtwItem),
        Text(cartItem.quantity.toString(), style: Theme.of(context).textTheme.titleSmall),
        const SizedBox(width: USizes.spaceBtwItem),
     
        const UCricularIcon(
          icon: Iconsax.add,
          width: 32,
          height: 32,
          size: USizes.md,
          color: UColors.white,
          backgroundColor: UColors.primary,
        ),
      ],
    );
  }
}