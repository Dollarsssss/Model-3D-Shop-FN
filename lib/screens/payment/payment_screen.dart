import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/screens/payment/payment_button.dart';
import 'package:flutter_ecommerce/screens/payment/payment_form.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  static String routeName = "/paymant";

  @override
  State<Payment> createState() => _PaymentState();
  
}

class _PaymentState extends State<Payment> {
  
 @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text(
              "Payment",
              style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(child: PaymentForm()),
      bottomNavigationBar: PaymentButton(),
    );
  }
}