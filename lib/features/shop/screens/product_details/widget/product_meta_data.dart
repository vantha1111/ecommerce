import 'package:computer_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:computer_store/common/widgets/products/product_price/product_price_text.dart';
import 'package:computer_store/common/widgets/texts/brand_title_text_verified_icon.dart';
import 'package:computer_store/common/widgets/texts/product_title_text.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/enums.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UProductMetaData extends StatelessWidget {
  const UProductMetaData({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //price and sale price
        Row(
          children: [
            //sale tag
            URoundedContainer(
              redius: USizes.sm,
              backgroundColor: UColors.secondary.withOpacity(0.8),
              padding: const EdgeInsets.symmetric(horizontal: USizes.sm, vertical: USizes.xs),
              child: Text('25%', style: Theme.of(context).textTheme.labelLarge!.apply(color: UColors.black)),
            ),
            const SizedBox(width: USizes.spaceBtwItem),
            //price
            Text('\$250', style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough)),
            const SizedBox(width: USizes.spaceBtwItem),
            const UProductPriceText(price: '170', isLarge: true),
          ],
        ),
        const SizedBox(height: USizes.spaceBtwItem / 1.5),
        //Title
        const UProductTitleText(title: 'Dell G7 "15'),
        const SizedBox(height: USizes.spaceBtwItem / 1.5),
        //stock state
        Row(
          children: [
            const UProductTitleText(title: 'Status'),
            const SizedBox(height: USizes.spaceBtwItem),
            Text('in Stock', style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: USizes.spaceBtwItem / 1.5),
        //brand
        const Row(
          children: [
            UBrandtitlewithverifiedIcon(title: 'Dell', brandTextSize: TextSizes.medium,),
          ],
        )

      ],
    );
  }
}