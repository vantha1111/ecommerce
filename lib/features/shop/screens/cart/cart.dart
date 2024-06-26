import 'package:computer_store/common/widgets/appbar/appbar_widget.dart';
import 'package:computer_store/features/shop/models/cart/cart_model.dart';
import 'package:computer_store/features/shop/models/cart/fetch_cart.dart';
import 'package:computer_store/features/shop/screens/cart/widget/the_cart_item.dart';
import 'package:computer_store/features/shop/screens/checkout/checkout.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<CartModel>(
        future: CartService().fetchCart(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text('Cart is empty'));
          } else {
            return Scaffold(
              appBar: UAppBar(
                  showBackArrow: true,
                  title: Text('Cart',
                      style: Theme.of(context).textTheme.headlineMedium)),
              body: Padding(
                padding: const EdgeInsets.all(USizes.defualtSpece),
                child: TheCartItem(cart: snapshot.data!),
              ),
              bottomNavigationBar: Padding(
                  padding: const EdgeInsets.all(USizes.defualtSpece),
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => CheckoutScreen(
                            cart: snapshot.data!,
                          )),
                      child: Text('Checkout \$${snapshot.data?.total}'))),
            );
          }
        });
    // return Scaffold(
    //     appBar: UAppBar(
    //         showBackArrow: true,
    //         title:
    //             Text('Cart', style: Theme.of(context).textTheme.headlineMedium)),
    //     body: FutureBuilder<CartModel>(
    //       future: CartService().fetchCart(),
    //       builder: (context, snapshot) {
    //         if (snapshot.connectionState == ConnectionState.waiting) {
    //           return Center(child: CircularProgressIndicator());
    //         } else if (snapshot.hasError) {
    //           return Center(child: Text('Error: ${snapshot.error}'));
    //         } else if (!snapshot.hasData || snapshot.data?.cartItem == null) {
    //           return Center(child: Text('Cart is empty'));
    //         } else {
    //           return Padding(
    //             padding: const EdgeInsets.all(USizes.defualtSpece),
    //             child: TheCartItem(cart: snapshot.data!),
    //           );
    //         }
    //       },
    //     ),
    //     bottomNavigationBar: Padding(
    //         padding: const EdgeInsets.all(USizes.defualtSpece),
    //         child: ElevatedButton(
    //             onPressed: () => Get.to(() => const CheckoutScreen()),
    //             child: const Text('Checkout \$256.0'))),
    //   );
  }
}
