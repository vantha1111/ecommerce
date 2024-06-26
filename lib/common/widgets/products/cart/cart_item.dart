
import 'package:computer_store/common/widgets/images/rounded_image.dart';
import 'package:computer_store/common/widgets/texts/brand_title_text_verified_icon.dart';
import 'package:computer_store/common/widgets/texts/product_title_text.dart';
import 'package:computer_store/features/shop/models/cart/cart_model.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import '../../../../utils/helpers/helper_functions.dart';

class UCartItem extends StatelessWidget {

  final CartItem cartItem;

  const UCartItem({
    super.key, required this.cartItem,
  });
  

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        URoundedImage(
          imageUrl: cartItem.product?.images?[0].url ?? '',
          isNetworkImae: true,
          width: 60,
          height: 60,
          padding: const EdgeInsets.all(USizes.sm),
          backgroundColor: UHelper.isDarkMode(context) ? UColors.darGrey :UColors.white,
        ),
        const SizedBox(width: USizes.spaceBtwItem),
    
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              UBrandtitlewithverifiedIcon(title: cartItem.product?.brand?.name ?? ''),
              Flexible(child: UProductTitleText(title: cartItem.product?.name ?? 'Unknown Product', maxLines: 1,)),
          
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan( text: 'Color', style: Theme.of(context).textTheme.bodySmall),   
                    TextSpan( text: 'green', style: Theme.of(context).textTheme.bodySmall), 
                    TextSpan( text: 'Size', style: Theme.of(context).textTheme.bodySmall), 
                    TextSpan( text: '15 lich', style: Theme.of(context).textTheme.bodySmall), 
                  ],
                )
              )
            ],
          ),
        )
      ],
    );
  }
}