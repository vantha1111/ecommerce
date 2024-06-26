import 'package:computer_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UOrderListItem extends StatelessWidget {
  const UOrderListItem({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = UHelper.isDarkMode(context);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: USizes.spaceBtwItem),
      itemBuilder: (_, index) => URoundedContainer(
        showBorder: true,
        padding: const EdgeInsets.all(USizes.md),
        backgroundColor: dark ? UColors.dark : UColors.light,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                const Icon(Iconsax.ship),
                const SizedBox(width: USizes.spaceBtwItem / 2),
      
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Processing',
                        style: Theme.of(context).textTheme.bodyLarge!.apply(color: UColors.primary, fontWeightDelta: 1),
                      ),
                      Text('81 Nav 2024', style: Theme.of(context).textTheme.headlineSmall,)
                    ],
                  ),
                ),
                IconButton(onPressed: (){},icon: const Icon(Iconsax.arrow_right_34, size: USizes.iconSm,))
              ],
            ),
            const SizedBox(height: USizes.spaceBtwItem),
            /// row 2
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.tag),
                      const SizedBox(width: USizes.spaceBtwItem / 2),
                  
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Order', style: Theme.of(context).textTheme.labelMedium),
                            Text('#345d4', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      const Icon(Iconsax.calculator),
                      const SizedBox(width: USizes.spaceBtwItem / 2),
                  
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Shipping Date', style: Theme.of(context).textTheme.labelMedium),
                            Text('03 FEB 2025', style: Theme.of(context).textTheme.titleMedium),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}