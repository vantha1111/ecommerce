

import 'package:computer_store/features/shop/models/cart/cart_model.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UBillingPaymentSection extends StatelessWidget {
  const   UBillingPaymentSection({super.key, required this.cart});
final CartModel cart;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text('Total',style: Theme.of(context).textTheme.bodyMedium),
        //     Text('\$256.0',style: Theme.of(context).textTheme.bodyMedium),
        //   ],
        // ),
        const SizedBox(height: USizes.spaceBtwItem / 2 ),
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Text('Discount(%)',style: Theme.of(context).textTheme.bodyMedium),
        //     Text('%${cart?.}',style: Theme.of(context).textTheme.labelLarge),
        //   ],
        // ),
        const SizedBox(height: USizes.spaceBtwItem / 2 ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Order total',style: Theme.of(context).textTheme.bodyMedium),
            Text('\$${cart.total}',style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}