import 'package:computer_store/common/widgets/appbar/appbar_widget.dart';
import 'package:computer_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:computer_store/common/widgets/products/cart/coupon_widget.dart';
import 'package:computer_store/features/shop/models/cart/cart_model.dart';
import 'package:computer_store/features/shop/models/cart/fetch_cart.dart';
import 'package:computer_store/features/shop/screens/cart/widget/the_cart_item.dart';
import 'package:computer_store/features/shop/screens/checkout/stripe.dart';
import 'package:computer_store/features/shop/screens/checkout/widget/billing_amount_seation.dart';
import 'package:computer_store/features/shop/screens/checkout/widget/billing_payment_section.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, required this.cart});
  final CartModel cart;
  @override
  Widget build(BuildContext context) {
    final dark = UHelper.isDarkMode(context);
    return Scaffold(
        appBar: UAppBar(
            showBackArrow: true,
            title:
                Text('Cart', style: Theme.of(context).textTheme.headlineSmall)),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(USizes.defualtSpece),
            child: Column(children: [
              FutureBuilder<CartModel>(
                future: CartService().fetchCart(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData ||
                      snapshot.data?.cartItem == null) {
                    return Center(child: Text('Cart is empty'));
                  } else {
                    return Padding(
                      padding: const EdgeInsets.all(USizes.defualtSpece),
                      child: TheCartItem(cart: snapshot.data!),
                    );
                  }
                },
              ),
              const SizedBox(height: USizes.spacebtwSection),
              const UCouponCode(),
              const SizedBox(height: USizes.spacebtwSection),
              URoundedContainer(
                showBorder: true,
                padding: const EdgeInsets.all(USizes.md),
                backgroundColor: dark ? UColors.black : UColors.white,
                child: Column(
                  children: [
                    UBillingPaymentSection(
                      cart: cart,
                    ),
                    SizedBox(height: USizes.spacebtwSection),
                    Divider(),
                    SizedBox(height: USizes.spacebtwSection),
                    UBillngAmountSection(),
                    SizedBox(height: USizes.spacebtwSection),
                  ],
                ),
              )
            ]),
          ),
        ),
        // bottomNavigationBar: Padding(
        //   padding: const EdgeInsets.all(USizes.defualtSpece),
        //   child: ElevatedButton(
        //     onPressed: () async {
        //       String? tokenJson = await AuthService().getToken();
        //       Token token = Token.fromJson(json.decode(tokenJson!));
        //       final url = Uri.parse(checkout);
        //       final res = await http.post(url,
        //           headers: {
        //             'Content-Type': 'application/json',
        //             'Authorization': 'Bearer ${token.accessToken}'
        //           },
        //           body: json.encode({"paymentMethod": "cards"}));

        //       final payment = json.decode(res.body) as String;
        //       print(payment);
        //       Get.to(() => WebViewScreen(uri: payment));
        //       // () => SuccessScreen(
        //       //     image: UImages.successPayment,
        //       //     title: 'payment Success!',
        //       //     subtile: 'your item will be Shipped soon!',
        //       //     onPressed: () => Get.offAll(() => const NavigationMeun())),
        //     },
        //     child: Text('Checkout \$${cart.total}'),
        //   ),
        // ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(8.0), // Adjust padding as needed
          child: ElevatedButton(
            onPressed: () async {
              try {
                // await initPaymentSheet();
                // String? tokenJson = await AuthService().getToken();
                // if (tokenJson == null) {
                //   throw Exception('Failed to get token');
                // }

                // Map<String, dynamic> tokenMap =
                //     json.decode(tokenJson); // Decode JSON

                // Token token =
                //     Token.fromJson(tokenMap); // Parse Token object from JSON

                // final url = Uri.parse(checkout);
                // final res = await http.post(url,
                //     headers: {
                //       'Content-Type': 'application/json',
                //       'Authorization': 'Bearer ${token.accessToken}'
                //     },
                //     body: json.encode({"paymentMethod": "cards"}));
                // if (res.statusCode == 201) {
                //   Map<String, dynamic> paymentMap =
                //       json.decode(res.body); // Decode payment response
                //   final String payment  = paymentMap['payment']; // Example: Accessing 'paymentUrl' field

                //   // Navigate to WebViewScreen with payment URL
                //   // Get.to(() => WebViewScreen(uri: payment));

                //   // Example navigation to SuccessScreen (uncomment and adjust as needed)
                //   // Get.to(() => SuccessScreen(
                //   //   image: UImages.successPayment,
                //   //   title: 'Payment Success!',
                //   //   subtitle: 'Your item will be shipped soon!',
                //   //   onPressed: () => Get.offAll(() => NavigationMenu()),
                //   // ));
                // } else {
                //   // Handle HTTP error
                //   throw Exception('Failed to post payment: ${res.statusCode}');
                // }
                // await Stripe.instance.presentPaymentSheet();

              } catch (e) {
                // Handle any errors
                print('Error: $e');
                // Show error message or retry logic if needed
              }
            },
            child: Text('Checkout \$${cart.total}'),
          ),
        ));
  }
}
