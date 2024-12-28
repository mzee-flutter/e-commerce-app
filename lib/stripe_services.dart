import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'api_keys.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeServices {
  static final StripeServices instance = StripeServices();
  Future<void> makePayment() async {
    try {
      final paymentIntentClientSecret = await createPaymentIntent(50, 'usd');

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret: paymentIntentClientSecret,
          merchantDisplayName: 'Hamza Asad',
          appearance: const PaymentSheetAppearance(
            colors: PaymentSheetAppearanceColors(
              primary: Color(0xff67802F),
            ),
          ),
        ),
      );
      await processPayment();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<String> createPaymentIntent(int amount, String currency) async {
    try {
      final Dio dio = Dio();

      Map<String, dynamic> data = {
        'amount': calculateAmount(amount),
        'currency': currency,
      };

      final response = await dio.post(
        'https://api.stripe.com/v1/payment_intents',
        data: data,
        options: Options(
          contentType: Headers.formUrlEncodedContentType,
          headers: {
            'Authorization': 'Bearer ${ApiKeys.stripeSecretApiKey}',
            'Content-Type': 'application/x-www-urlencoded',
          },
        ),
      );

      if (response.data != null) {
        return response.data['client_secret'];
      } else {
        throw Exception('Failed to get client-secret');
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      throw Exception(e.toString());
    }
  }

  Future<void> processPayment() async {
    await Stripe.instance.presentPaymentSheet();
  }

  String calculateAmount(amount) {
    final calculateAmount = amount * 100;
    return calculateAmount.toString();
  }
}
