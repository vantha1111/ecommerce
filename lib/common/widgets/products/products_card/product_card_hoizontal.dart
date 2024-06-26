

import 'package:computer_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:computer_store/common/widgets/icons/cricular_icon.dart';
import 'package:computer_store/common/widgets/images/rounded_image.dart';
import 'package:computer_store/common/widgets/products/product_price/product_price_text.dart';
import 'package:computer_store/common/widgets/texts/brand_title_text_verified_icon.dart';
import 'package:computer_store/common/widgets/texts/product_title_text.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/image_strings.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UProductCardHorizaontal extends StatelessWidget {
  const UProductCardHorizaontal({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelper.isDarkMode(context);

    return  Container(
        width: 310,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(USizes.productImageRadiue),
          color: dark ? UColors.darkerGrey : UColors.lightContainer,
        ),
        child: Row(
          children: [
            URoundedContainer(
              height: 120,
              padding: const EdgeInsets.all(USizes.sm),
              backgroundColor: dark ? UColors.dark : UColors.light,
              child: Stack(
                children: [
                  const SizedBox(
                    height: 120,
                    width: 120,
                    child: URoundedImage(imageUrl: UImages.appLogo, applyImageRadius: true)
                  ),

                  //sale tag
                  Positioned(
                    top: 12,
                    child: URoundedContainer(
                      redius: USizes.sm,
                      backgroundColor: UColors.secondary.withOpacity(0.8),
                      padding: const EdgeInsets.symmetric(horizontal: USizes.sm, vertical: USizes.xs),
                      child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: UColors.black)),
                    ),
                  ),
      
                  const Positioned(
                    top: 0,
                    right: 0,
                    child: UCricularIcon(icon: Iconsax.heart5, color: Colors.red,)),
                ],
              ),
            ),

            //Details
            SizedBox(
              width: 172,
              child: Padding(
                padding: const EdgeInsets.only(top: USizes.sm,left: USizes.sm),
                child: Column(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        UProductTitleText(title: 'green Nike Half Sleeves shrits', smallSize: true),
                        SizedBox(width: USizes.spaceBtwItem / 2),
                        UBrandtitlewithverifiedIcon(title: 'Nike')
                      ],
                    ),

                    const Spacer(),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //pricing
                        const Flexible(child: UProductPriceText(price: '2560')),

                        //Add into cart
                        Container(
                          decoration: const BoxDecoration(
                          color: UColors.dark,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(USizes.cardRaduieMd),
                            bottomRight: Radius.circular(USizes.productImageRadiue)
                          ),
                        ),
                        child: const SizedBox(
                          width: USizes.iconLg * 1.2,
                          height: USizes.iconLg * 1.2,
                          child: Center(child: Icon(Iconsax.add, color: UColors.white))), 
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
    );
  }
}