import 'dart:convert';
import 'package:computer_store/features/shop/models/api/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

Future<void> initPaymentSheet() async {
  try {
    // 1. create payment intent on the server
    final data = await createTestPaymentSheet();

    // 2. initialize the payment sheet
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Set to true for custom flow
        customFlow: false,
        // Main params
        merchantDisplayName: 'Flutter Stripe Store Demo',
        paymentIntentClientSecret: data['paymentIntent'],
        // Customer keys
        customerEphemeralKeySecret: data['ephemeralKey'],
        customerId: data['customer'],
        // Extra options
        applePay: const PaymentSheetApplePay(
          merchantCountryCode: 'US',
        ),
        googlePay: const PaymentSheetGooglePay(
          merchantCountryCode: 'US',
          testEnv: true,
        ),
        style: ThemeMode.dark,
      ),
    );
    // setState(() {
    //   _ready = true;
    // });
  } catch (e) {
    rethrow;
  }
}

createTestPaymentSheet() async {
  final response = await http.post(
    Uri.parse(orderUrl),
    body: jsonEncode({"paymentMethod": "cards"}),
    headers: {'Content-Type': 'application/json'},
  );

  if (response.statusCode == 200) {
    final responseBody = json.decode(response.body);
    print(response);
    return responseBody['token'];
  } else {
    throw Exception('Failed to login');
  }
}
