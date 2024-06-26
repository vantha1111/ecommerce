import 'package:computer_store/common/widgets/products/cart/add_remove_button.dart';
import 'package:computer_store/common/widgets/products/cart/cart_item.dart';
import 'package:computer_store/common/widgets/products/product_price/product_price_text.dart';
import 'package:computer_store/features/shop/models/cart/cart_model.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TheCartItem extends StatelessWidget {
  const TheCartItem({
    super.key,
    required this.cart,
    this.showAddRemoveButtons = true,
  });
  
  final CartModel cart;
  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      separatorBuilder: (_, __) => const SizedBox(height: USizes.spacebtwSection), 
      itemCount: cart.cartItem?.length ?? 0,
      itemBuilder: (_, index) {
        final cartItem = cart.cartItem![index];
        return Column(
          children: [
            UCartItem(cartItem: cartItem),
            if (showAddRemoveButtons) const SizedBox(height: USizes.spaceBtwItem),
            if (showAddRemoveButtons)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      SizedBox(width: 70),
                      UProductwithAddRemove(cartItem:cartItem),
                    ],
                  ),
                  UProductPriceText(price: cartItem.amount.toString()),
                ],
              ),
          ],
        );
      },
    );
  }
}
