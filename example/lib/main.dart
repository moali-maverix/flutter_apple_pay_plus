import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_apple_pay_plus/flutter_apple_pay_plus.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> makePayment() async {
    // To store apple payment data
    dynamic applePaymentData;

    // List of items with label & price
    List<PaymentItem> paymentItems = [
      PaymentItem(label: 'Label', amount: 1.00, shippingcharge: 2.00),
    ];

    try {
      // initiate payment
      applePaymentData = await ApplePayFlutter.makePayment(
        countryCode: "US",
        currencyCode: "SAR",
        paymentNetworks: [
          PaymentNetwork.visa,
          PaymentNetwork.mastercard,
          PaymentNetwork.amex,
          PaymentNetwork.mada,
        ],
        merchantIdentifier: "merchant.sa.urwayphp",
        paymentItems: paymentItems,
        customerEmail: "demo.user@business.com",
        customerName: "Demo User",
        companyName: "Concerto Soft",
      );

      // This logs the Apple Pay response data
      print(applePaymentData.toString());
    } on PlatformException {
      print('Failed payment');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Apple Pay Test')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Waiting for Apple Pay modal.'),
              ElevatedButton(
                child: Text('Call payment'),
                onPressed: () => makePayment(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
