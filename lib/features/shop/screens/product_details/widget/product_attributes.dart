
import 'package:computer_store/common/widgets/chip/choice_chip.dart';
import 'package:computer_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:computer_store/common/widgets/products/product_price/product_price_text.dart';
import 'package:computer_store/common/widgets/texts/product_title_text.dart';
import 'package:computer_store/common/widgets/texts/section_heading.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UProductAttribates extends StatelessWidget {
  final String? description;
  final double? originalPrice;
  final double? discountedPrice;
  final bool? inStock;
  final List<String>? colors;
  final List<String>? sizes;

  const UProductAttribates({
    super.key,
    this.description,
    this.originalPrice,
    this.discountedPrice,
    this.inStock,
    this.colors,
    this.sizes,
  });

  @override
  Widget build(BuildContext context) {
    final dark = UHelper.isDarkMode(context);
    return Column(
      children: [
        // Selected attributes pricing and description
        URoundedContainer(
          padding: const EdgeInsets.all(USizes.md),
          backgroundColor: dark ? UColors.darkerGrey : UColors.grey,
          child: Column(
            children: [
              Row(
                children: [
                  const USectionHeading(title: 'Variation', showActionButton: false),
                  const SizedBox(width: USizes.spaceBtwItem),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const UProductTitleText(title: 'Price:', smallSize: true),
                          if (originalPrice != null)
                            Text(
                              '\$${originalPrice!.toStringAsFixed(2)}',
                              style: Theme.of(context).textTheme.titleSmall!.apply(decoration: TextDecoration.lineThrough),
                            ),
                          const SizedBox(width: USizes.spaceBtwItem),
                          if (discountedPrice != null)
                            UProductPriceText(price: discountedPrice!.toStringAsFixed(2)),
                        ],
                      ),
                      Row(
                        children: [
                          const UProductTitleText(title: 'Status:', smallSize: true),
                          Text(
                            inStock == true ? 'In Stock' : 'Out of Stock',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              UProductTitleText(
                title: description ?? 'No description available',
                smallSize: true,
                maxLines: 4,
              ),
            ],
          ),
        ),
        const SizedBox(height: USizes.spacebtwSection),
        // Colors
        if (colors != null && colors!.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const USectionHeading(title: 'Colors'),
              const SizedBox(height: USizes.spaceBtwItem / 2),
              Wrap(
                spacing: 8,
                children: colors!
                    .map((color) => UChoiceChip(
                          text: color,
                          selected: false,
                          onSelected: (value) {},
                        ))
                    .toList(),
              ),
            ],
          ),
        // Sizes
        if (sizes != null && sizes!.isNotEmpty)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const USectionHeading(title: 'Size'),
              const SizedBox(height: USizes.spaceBtwItem / 2),
              Wrap(
                spacing: 8,
                children: sizes!
                    .map((size) => UChoiceChip(
                          text: size,
                          selected: false,
                          onSelected: (value) {},
                        ))
                    .toList(),
              ),
            ],
          ),
      ],
    );
  }
}


